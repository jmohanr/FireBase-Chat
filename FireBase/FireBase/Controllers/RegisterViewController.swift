

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBAction func registerPressed(_ sender: UIButton) {
        
        if let email = emailTextfield.text,
           let password = passwordTextfield.text {
            Auth.auth().createUser(withEmail: email, password: password) { [weak self] authResult, error in
                guard let self = self else { return }
                if error == nil {
                    if let details = authResult  {
                        self.performSegue(withIdentifier: "chatVC", sender: self)
                    }
                   
                } else {
                    if let warning = error?.localizedDescription {
                        self.presentAlert(warning)
                    }
                }
            }
        }
    }
}
