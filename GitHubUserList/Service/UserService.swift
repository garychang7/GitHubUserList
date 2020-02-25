//
//  UserService.swift
//  GitHubUserList
//
//  Created by gary on 2020/2/25.
//  Copyright © 2020 gary. All rights reserved.
//

import UIKit

typealias completionWithUsers = ([User]) -> Void
typealias completionWithMsg = (String) -> Void

class UserService: NSObject {

    
    static let instance = UserService()
    
    func getUserList(completion: @escaping completionWithUsers,fail: @escaping completionWithMsg) {
        let url = "/users?since=100"
        ApiService.instance.get(url: url) { (result, error) in
            
            if case .failure = error {
                fail("get user list error")
                return
            }
  
            let decoder = JSONDecoder()
            let baseModel = try? decoder.decode([UserCodable].self, from: result!)
            guard let model = baseModel else {
                fail("get user list error")
                return
            }
        
            var users = [User]()
            for u in model {
                let user = User(codable: u)
                users.append(user)
            }
            completion(users)
        }
    }
    
    
}
