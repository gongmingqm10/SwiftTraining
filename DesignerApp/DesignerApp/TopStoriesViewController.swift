//
//  TopStoriesViewController.swift
//  DesignerApp
//
//  Created by Ming Gong on 6/23/15.
//  Copyright © 2015 gongmingqm10. All rights reserved.
//

import UIKit

class TopStoriesViewController: UITableViewController {
    
    @IBOutlet var storyTableView: UITableView!
    
    var stories: [Story] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        staticStories()
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = storyTableView.dequeueReusableCellWithIdentifier("StoryTableViewCell", forIndexPath: indexPath) as! StoryTableViewCell
        cell.populate(stories[indexPath.row])
        return cell
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stories.count
    }
    
    private func staticStories() {
        let badges = ["badge-pinned", "badge-show", "badge-sitedesign", "badge-sketch", "badge-type"]
        let titles = ["Designing For (and With) Color Blindness", "Apple's Indies", "Show DN: We made Boomstat.works", "Site Design: The Obtuse Triangle", "Dropbox-Material Design", "Folyo is joining Workshop", "Designer News Digest"]
        let authors = ["Ming Gong", "Andrew", "Angel", "Jered", "Ao Zhu", "Sarah", "Mengto"]
        
        for _ in 0...20 {
            let story = Story(json: [
                "title": titles[Int(arc4random_uniform(UInt32(titles.count)))],
                "author":authors[Int(arc4random_uniform(UInt32(authors.count)))],
                "badge": badges[Int(arc4random_uniform(UInt32(badges.count)))],
                "time_desc": "\(Int(arc4random_uniform(UInt32(23))))h",
                "vote_count": Int(arc4random_uniform(UInt32(250))),
                "comment_count": Int(arc4random_uniform(UInt32(100)))])
            stories.append(story)
        }
    }
    
    
}
