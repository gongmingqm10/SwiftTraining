//
//  Moment.swift
//  Wechat
//
//  Created by Ming Gong on 6/18/15.
//  Copyright © 2015 gongmingqm10. All rights reserved.
//

import Foundation

class Moment: NSObject {
    var title: String?
    var imageHref: String?
    var content: String?
    
    init(json: NSDictionary) {
        self.title = json["title"] as? String
        self.imageHref = json["imageHref"] as? String
        self.content = json["description"] as? String
    }
    
    func isValid() -> Bool {
        return !(title == nil && content == nil)
    }
    
}
