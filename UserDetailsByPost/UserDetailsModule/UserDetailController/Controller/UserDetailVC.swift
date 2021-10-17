//
//  UserDetailVC.swift
//  UserDetailsByPost
//
//  Created by TejaDanasvi on 13/10/21.
//

import UIKit
protocol UserDetailsValues {
    var userData: ResponseUserData?  { get set }
}

class UserDetailVC: UIViewController, UserDetailsValues {
    var userData: ResponseUserData?
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
  
}
extension UserDetailVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userData?.id.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    

}

