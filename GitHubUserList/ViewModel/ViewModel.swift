//
//  ViewModel.swift
//  GitHubUserList
//
//  Created by gary on 2020/2/25.
//  Copyright © 2020 gary. All rights reserved.
//

import UIKit

protocol ViewModelDelegate {
    
    func updateView()
    func showAlert(msg:String)
    
}

class ViewModel: NSObject {

    var delegate:ViewModelDelegate?
    var dataSource = [User]()
    
    func fetchData() {
        
        UserService.instance.getUserList(completion: { (users) in
            
            self.dataSource = users
            self.delegate?.updateView()
            
        }) { (errorMsg) in
            
            self.delegate?.showAlert(msg: errorMsg)
            
        }
    }
    
    
    
}
