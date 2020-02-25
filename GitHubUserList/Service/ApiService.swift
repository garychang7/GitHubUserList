//
//  ApiService.swift
//  GitHubUserList
//
//  Created by gary on 2020/2/25.
//  Copyright © 2020 gary. All rights reserved.
//

import UIKit
import Alamofire


enum NetworkError: Error {
    case warning
    case failure
    case success
}


typealias completionHandler = (Data?,NetworkError) -> Void
class ApiService: NSObject {

    static let instance = ApiService()
    
    func get(url:String,completion:@escaping completionHandler) {
        
        let url = domain_url + url
        let params: Parameters = [:]

        Alamofire.request(url, parameters: params).responseJSON { (response) in
            guard let json = response.data else {
                completion(nil,.failure)
                return
            }
            completion(json,.success)
        }
    }
    
}
