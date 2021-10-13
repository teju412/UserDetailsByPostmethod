//
//  UserListVC.swift
//  UserDetailsByPost
//
//  Created by TejaDanasvi on 11/10/21.
//

import UIKit
import Promises
class UserListVC: UIViewController {
    var viewModel = UserViewModel()

    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @IBAction func submitBttnAction(_ sender: Any) {
        guard let nametf = nameTF.text,
        let emailtf = emailTF.text else { return }
        
        let postData = PostDetails(name: nametf, gender: "", email: emailtf, status: "")
     
        viewModel.postUserData(data: postData).then({ reponse in
            self.showAlert(message: "Successfully submitted", actions:[
                    UIAlertAction(title: "OK", style: .default, handler: { _ in
                print("OkayButton clicked")
            })])
        }).catch { error in
            print("eror")
        }
    }
    
    
}

extension UIViewController {
    func showAlert(title: String = "", message: String = "", actions: [UIAlertAction]) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        _ = actions.map { action in
            alert.addAction(action)
        }
        self.present(alert, animated: true, completion: nil)
    }
}
