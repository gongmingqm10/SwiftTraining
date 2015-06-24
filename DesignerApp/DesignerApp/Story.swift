//
//  Story.swift
//  DesignerApp
//
//  Created by Ming Gong on 6/24/15.
//  Copyright © 2015 gongmingqm10. All rights reserved.
//

import Foundation

class Story: NSObject {
    
    var title: String?
    var badge: String?
    var author: String?
    var timeDesc: String?
    var commentCount: Int
    var voteCount: Int
    
    init(json: NSDictionary) {
        self.title = json["title"] as? String
        self.badge = json["badge"] as? String
        self.author = json["author"] as? String
        self.timeDesc = json["time_desc"] as? String
        self.commentCount = json["comment_count"] as! Int
        self.voteCount = json["vote_count"] as! Int
    }
    
}
