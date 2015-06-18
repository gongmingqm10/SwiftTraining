//
//  MomentDetailController.swift
//  Wechat
//
//  Created by Ming Gong on 6/18/15.
//  Copyright © 2015 gongmingqm10. All rights reserved.
//

import UIKit

class MomentDetailController: UIViewController {
    
    @IBOutlet weak var momentImage: UIImageView!
    @IBOutlet weak var momentTitle: UILabel!
    @IBOutlet weak var momentContent: UILabel!
    
    var moment: Moment?
    
    override func viewDidLoad() {
        self.momentImage.layer.cornerRadius = self.momentImage.bounds.width / 2.0
        self.momentImage.clipsToBounds = true
        
        self.momentTitle.text = moment?.title
        self.momentContent.text = moment?.content
        
        let defaultAvatar = UIImage(named: "DefaultAvatar")
        if let imageUrl = moment?.imageHref {
            self.momentImage.sd_setImageWithURL(NSURL(string: imageUrl))
            self.momentImage.sd_setImageWithURL(NSURL(string: imageUrl), placeholderImage: defaultAvatar)
        } else {
            self.momentImage.image = defaultAvatar
        }
    }
    
}
