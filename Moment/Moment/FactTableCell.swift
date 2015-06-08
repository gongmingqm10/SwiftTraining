//
//  FactTableCell.swift
//  Moment
//
//  Created by Ming Gong on 6/8/15.
//  Copyright (c) 2015 gongmingqm10. All rights reserved.
//

import UIKit

class FactTableCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var content: UILabel!
    @IBOutlet weak var avatar: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.content.adjustsFontSizeToFitWidth = false
        self.content.numberOfLines = 0
    }
    
    func populate(fact: Fact) {
        self.title.text = fact.title
        self.content.text = fact.content
        if let imageUrl = fact.image {
            self.imageView?.sd_setImageWithURL(NSURL(string: imageUrl))
            self.imageView?.contentMode = .ScaleAspectFill
        }
    }
}
