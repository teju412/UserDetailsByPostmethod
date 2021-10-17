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
    var genderButtons: [UIButton]?

    @IBOutlet weak var statusSBttn: UISwitch!
    @IBOutlet weak var maleBttn: UIButton!
    @IBOutlet weak var femaleBttn: UIButton!
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        genderButtons = [femaleBttn, maleBttn]
    }
    

    @IBAction func submitBttnAction(_ sender: Any) {
        guard let nametf = nameTF.text,
        let emailtf = emailTF.text,
        (femaleBttn.isSelected == true || maleBttn.isSelected == true) else { return }
        let selectedGender = femaleBttn.isSelected ? "Female" : "Male"
        let statusStr = statusSBttn.isOn ? "active" : "inactive"
        let postData = PostDetails(name: nametf, gender: selectedGender, email: emailtf, status: statusStr)
     
        viewModel.postUserData(data: postData).then({ reponse in
            self.showAlert(message: "Successfully submitted", actions:[
                    UIAlertAction(title: "OK", style: .default, handler: { _ in
                print("OkayButton clicked")
            })])
        }).catch { error in
            print("eror")
        }
    }
    
    @IBAction func genderButtonAction(_ sender: UIButton) {
        genderButtons?.forEach({ $0.isSelected = false })
        sender.isSelected = true
//        if sender.tag == 1 {
//            maleBttn.isSelected = true
//            maleBttn.isSelected = false
//            strGender = "male"
//            print(strGender)
//
//        } else if sender.tag == 2 {
//            maleBttn.isSelected = true
//            maleBttn.isSelected = false
//            strGender = "female"
//            print(strGender)
//
//        }
    }
    @IBAction func statusSwitchAction(_ sender: UISwitch) {
//        strStatus = sender.isOn ?  "active" : "Inactive"
//        if sender.isOn {
//            strStatus = "active"
//        } else {
//            strStatus = "inactive"
//
//        }
    }
    
//    @IBAction func femaleBttnAction(_ sender: Any) {
//    }
//    func chooseGender(gender: Gender) {
//        switch gender {
//        case .male:
//            self.maleBttn.isSelected = true
//        case .female:
//            <#code#>
//        }
//    }
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
