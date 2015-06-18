//
//  MomentTableCell.swift
//  Wechat
//
//  Created by Ming Gong on 6/18/15.
//  Copyright © 2015 gongmingqm10. All rights reserved.
//

import UIKit

class MomentTableCell: UITableViewCell {
    
    @IBOutlet weak var momentTitle: UILabel!
    @IBOutlet weak var momentContent: UILabel!
    @IBOutlet weak var momentImage: UIImageView!

    override func layoutSubviews() {
        self.momentImage.layer.cornerRadius = self.momentImage.bounds.width / 2.0
        self.momentImage.clipsToBounds = true
    }
    
    func populate(moment: Moment) {
        self.momentTitle.text = moment.title
        self.momentContent.text = moment.content
        
        let defaultAvatar = UIImage(named: "DefaultAvatar")
        if let imageUrl = moment.imageHref {
            self.momentImage.sd_setImageWithURL(NSURL(string: imageUrl))
            self.momentImage.sd_setImageWithURL(NSURL(string: imageUrl), placeholderImage: defaultAvatar)
        } else {
            self.momentImage.image = defaultAvatar
        }
    }
}
