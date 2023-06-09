

import UIKit
import FirebaseAuth
import FirebaseFirestore

class ChatViewController: UIViewController {
    
    let db = Firestore.firestore()
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    var messages: [Messages] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchMessages()
        tableView.dataSource = self
        tableView.register(UINib(nibName: constants.messageCell, bundle: nil), forCellReuseIdentifier: constants.messageCell)
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
        if let user = Auth.auth().currentUser, let message = messageTextfield.text,
           let email = user.email,
           let data = UIImage(named: "MeAvatar")?.pngData(), message.count > 0 {
            let timestamp = NSDate().timeIntervalSince1970
            db.collection(FStore.collectionName).addDocument(data: [FStore.bodyField:message,FStore.senderField:email,FStore.image:data,FStore.dateField:timestamp]) { (error) in
                if error == nil {
                }
            }
        }
    }
    
    func fetchMessages() {
        db.collection(FStore.collectionName).order(by: FStore.dateField, descending: false).addSnapshotListener { [weak self] snapShot, error in
            if error == nil {
                if let snap = snapShot {
                    self?.messages.removeAll()
                    for value in snap.documents {
                        let text = Messages.init(json: value.data())
                        self?.messages.append(text)
                    }
                    DispatchQueue.main.async {
                        self?.tableView.reloadData()
                        self?.messageTextfield.text = ""
                    }
                }
            }
        }
    }
    
    @IBAction func onTapLogOut(_ sender: UIBarButtonItem) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            self.dismiss(animated: true)
        } catch let signOutError as NSError {
            self.presentAlert(signOutError.localizedDescription)
            print("Error signing out: %@", signOutError)
        }
    }
    
}

extension ChatViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: constants.messageCell) as? MessageCell {
            if let data = messages[indexPath.row].imagedata {
                cell.profileImg.image = UIImage(data: data)
            }
            cell.messageLabel.text = messages[indexPath.row].body
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
}
