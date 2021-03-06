
import UIKit
import Firebase

class ContentsViewController: UIViewController {

    
    @IBOutlet weak var contentsTextField: UITextField!
    var ref: DatabaseReference!
    let uid = Auth.auth().currentUser!.uid
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        
        
        
        let date = Date()
//        DateFormatter = "yyyy MM dd"
//        print(date)
        
    }
    @IBAction func buttonAction(_ sender: UIButton) {
        guard let contents = contentsTextField.text else { return }
        ref.child("user").child("uid").observe(.childAdded, with: { (snapshot) in
            if let dic = snapshot.value as? [String: Any] {
                if let name = dic["username"] as? String {
                    
                }
                
            }
        }, withCancel: nil)
        
        self.navigationController?.popViewController(animated: true)
    }
    
}
