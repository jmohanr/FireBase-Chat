

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    

    @IBAction func loginPressed(_ sender: UIButton) {
        if let email = emailTextfield.text,
           let password = passwordTextfield.text {
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] results, error in
                guard let self = self else { return }
                
                if error == nil {
                    if let _ = results {
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
