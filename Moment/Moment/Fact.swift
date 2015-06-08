//
//  Fact.swift
//  Moment
//
//  Created by Ming Gong on 6/5/15.
//  Copyright (c) 2015 gongmingqm10. All rights reserved.
//

import Foundation

class Fact: NSObject {
    var title: String?
    var image: String?
    var content: String?
    
    init(json: NSDictionary) {
        self.title = json["title"] as? String
        self.image = json["imageHref"] as? String
        self.content = json["description"] as? String
    }
    
    func isValid() -> Bool {
        return !(title == nil && content == nil)
    }
}