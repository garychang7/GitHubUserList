//
//  User.swift
//  GitHubUserList
//
//  Created by gary on 2020/2/25.
//  Copyright © 2020 gary. All rights reserved.
//

import UIKit

class User: NSObject {

    var avatarUrl : String?
    var eventsUrl : String?
    var followersUrl : String?
    var followingUrl : String?
    var gistsUrl : String?
    var gravatarId : String?
    var htmlUrl : String?
    var id : Int?
    var login : String?
    var nodeId : String?
    var organizationsUrl : String?
    var receivedEventsUrl : String?
    var reposUrl : String?
    var siteAdmin : Bool?
    var starredUrl : String?
    var subscriptionsUrl : String?
    var type : String?
    var url : String?
    
    override init() {
        
    }
    
    init(codable:UserCodable) {
        self.avatarUrl = codable.avatarUrl
        self.eventsUrl = codable.eventsUrl
        self.followersUrl = codable.followersUrl
        self.followingUrl = codable.followingUrl
        self.gistsUrl = codable.gistsUrl
        self.gravatarId = codable.gravatarId
        self.htmlUrl = codable.htmlUrl
        self.id = codable.id
        self.login = codable.login
        self.nodeId = codable.nodeId
        self.organizationsUrl = codable.organizationsUrl
        self.receivedEventsUrl = codable.receivedEventsUrl
        self.siteAdmin = codable.siteAdmin
        self.starredUrl = codable.starredUrl
        self.subscriptionsUrl = codable.subscriptionsUrl
        self.type = codable.type
        self.url = codable.url
    }
}
