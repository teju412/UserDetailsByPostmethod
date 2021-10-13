//
//  UserSearchModel.swift
//  UserDetailsByPost
//
//  Created by TejaDanasvi on 11/10/21.
//

import Foundation

//user post data
struct PostDetails: Codable {
    let name: String
    let gender: String
    let email: String
    let status: String
}
// getting response data
struct ResponseForPost: Codable {
    var data: ResponseUserData?
}

struct ResponseUserData: Codable {
    var id: Int?
    var name: String?
    var gender: String?
    var email: String?
    var status: String?
}
struct PostUserDetailsToServer: PostRequest {
    var userdata: Codable?
    var requestType: RequestType
    var url: URL?
    var token: String? {
        return "Bearer 67025e25becd2b06e5f98a2a6de02037bb69f103dc12af77a84615ee6f83b4fa"
    }
    
}
