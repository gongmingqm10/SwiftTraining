//
//  ViewController.swift
//  Moment
//
//  Created by Ming Gong on 6/5/15.
//  Copyright (c) 2015 gongmingqm10. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var navTtitle: UINavigationItem!
    
    @IBOutlet var factTableView: UITableView!
    var facts: [Fact]! = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        factTableView.rowHeight = 120
        readJson()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func readJson() {
        if let path = NSBundle.mainBundle().pathForResource("facts", ofType: "json") {
            if let data = NSData(contentsOfFile: path) {
                let json = JSON(data: data, options: NSJSONReadingOptions.AllowFragments, error: nil)
                navTtitle.title = json["title"].string
                for factJson in json["rows"].arrayValue {
                    let fact = Fact(json: factJson.dictionaryObject!)
                    if fact.isValid() {
                        facts.append(Fact(json: factJson.dictionaryObject!))
                    }
                }
                factTableView.reloadData()
            }
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = factTableView.dequeueReusableCellWithIdentifier("FactCell", forIndexPath: indexPath) as! FactTableCell
        let fact = facts[indexPath.row]
        cell.populate(fact)
        return cell
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return facts.count
    }
    
//    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//
//    }
}

