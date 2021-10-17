//
//  ViewModel.swift
//  UserDetailsByPost
//
//  Created by TejaDanasvi on 12/10/21.
//

import Foundation
import Promises
class UserViewModel {
    
    func postUserData(data: PostDetails) -> Promise<ResponseForPost> {
        return  PostUserDetailsToServer( userdata: data, requestType: .POST, url: URL(string: "https://gorest.co.in/public/v1/users")).postData()
    }
}
