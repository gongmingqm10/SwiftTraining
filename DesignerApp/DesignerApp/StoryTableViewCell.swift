//
//  StoryTableViewCell.swift
//  DesignerApp
//
//  Created by Ming Gong on 6/24/15.
//  Copyright © 2015 gongmingqm10. All rights reserved.
//

import UIKit

class StoryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var storyIcon: UIImageView!
    @IBOutlet weak var storyTitle: UILabel!
    @IBOutlet weak var storyAuthor: UILabel!
    @IBOutlet weak var storyVoteCount: UIButton!
    @IBOutlet weak var storyCommentCount: UIButton!
    @IBOutlet weak var storyTimeLabel: UILabel!
    
    @IBOutlet weak var storyVoteIcon: UIImageView!
    @IBOutlet weak var storyCommentIcon: UIImageView!
    
    
    func populate(story: Story) {
        storyIcon.image = UIImage(named: story.badge!)
        storyTitle.text = story.title
        storyAuthor.text = story.author
        storyTimeLabel.text = story.timeDesc
        storyCommentCount.setTitle(String(story.commentCount), forState: UIControlState.Normal)
        storyVoteCount.setTitle(String(story.voteCount), forState: UIControlState.Normal)
    }
    
    
    @IBAction func voteAction(sender: AnyObject) {
    }
    
    @IBAction func commentAction(sender: AnyObject) {
    }
    
}
