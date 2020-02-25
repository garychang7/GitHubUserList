//
//  UserTableViewCell.swift
//  GitHubUserList
//
//  Created by gary on 2020/2/25.
//  Copyright © 2020 gary. All rights reserved.
//

import UIKit
import Kingfisher

class UserTableViewCell: UITableViewCell {

    
    @IBOutlet weak var avatarImageView: UIImageView!
    
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        avatarImageView.layer.cornerRadius = avatarImageView.frame.size.width / 2
        avatarImageView.layer.masksToBounds = true
        subTitleLabel.layer.cornerRadius = 8
        subTitleLabel.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    
    func setupUser(user:User) {
        
        titleLable.text = user.login
        subTitleLabel.isHidden = !user.siteAdmin!
        subTitleLabel.text = user.siteAdmin! ? "STAFF":""
        
        let imageUrl = URL(string: user.avatarUrl!)
        avatarImageView.kf.setImage(with: imageUrl)
    }
}
