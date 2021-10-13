//
//  DataManger.swift
//  AllPracticeConcepts
//
//  Created by TejaDanasvi on 2/10/21.
//

//fullfill , reject

import Foundation
import Promises

protocol PostRequest {
    var url: URL? { get }
    var token: String? { get }
    var requestType: RequestType { get }
    var userdata: Codable? { get  }
    
}

enum RequestType: String {
    case POST
    case PATCH
    case DELETE
}
extension PostRequest {
    func postData<T: Codable>() -> Promise<T> {
        return Promise<T> { fullfill, reject in
        guard let myUrl = url else { return }
        let request = NSMutableURLRequest(url: myUrl)//subclass of nsurlrequest  that allows to change the request properties
            let config = URLSessionConfiguration.default//when uploading or download data through URLSession first step to configure the object
        //config.timeoutIntervalForRequest = 60
        config.httpAdditionalHeaders = ["Authorization" : token ?? ""]
            // different headers
            /*Authorization
            Connection
            Host
            Proxy-Authenticate
            Proxy-Authorization
            WWW-Authenticate */
            
        let session = URLSession(configuration: config)
            request.httpMethod = requestType.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        guard let jsonData = userdata?.toJSONData() else { return }
        request.httpBody = jsonData
        session.dataTask(with: request as URLRequest) { data, response, error in
            guard let data = data else { return }
            do {
                let gitData = try JSONDecoder().decode(T.self, from: data)
                fullfill(gitData)
            } catch let err {
               reject(err)
            }
            }.resume()
        }
    }
    
}

extension Encodable {
  func toJSONData() -> Data? {
    return try? JSONEncoder().encode(self)
  }
}


//func postData(userdata: Codable) {
//
//
//        let request = NSMutableURLRequest(url: url)
//        let config = URLSessionConfiguration.default
//        config.timeoutIntervalForRequest = 60
//        let authString = "Bearer 67025e25becd2b06e5f98a2a6de02037bb69f103dc12af77a84615ee6f83b4fa"
//        config.httpAdditionalHeaders = ["Authorization" : authString]
//
//        let session = URLSession(configuration: config)
//        request.httpMethod = "POST"
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.addValue("application/json", forHTTPHeaderField: "Accept")
//        guard let jsonData = userdata.toJSONData() else {
//            return
//
//        }
//        request.httpBody = jsonData
//
//        _ = session.dataTask(with: request as URLRequest) { data, response, error in
//
//            guard let data = data else { return }
//            do {
//
//                let gitData = try JSONDecoder().decode(ResponseForPost.self, from: data)
//                print("response data:", gitData)
//
//            } catch let err {
//                print("Err", err)
//            }
//            }.resume()
//    }
