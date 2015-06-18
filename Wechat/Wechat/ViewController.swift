//
//  ViewController.swift
//  Wechat
//
//  Created by Ming Gong on 6/18/15.
//  Copyright © 2015 gongmingqm10. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    
    @IBOutlet var factTableView: UITableView!
    @IBOutlet weak var factNavigationTitle: UINavigationItem!
    
    let momentDetailSegue = "momentDetailSegue"
    
    var moments: [Moment] = []
    var selectedMoment: Moment?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        readJson()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func readJson() {
        let path = NSBundle.mainBundle().pathForResource("facts-sample", ofType: "json")
        let jsonData = NSData(contentsOfFile: path!)
 
        do {
            let jsonResult = try NSJSONSerialization.JSONObjectWithData(jsonData!, options: NSJSONReadingOptions.MutableContainers)
            factNavigationTitle.title = jsonResult["title"] as? String
            let rows = jsonResult["rows"] as! Array<AnyObject>
            for index in 0...rows.count - 1 {
                let row = rows[index] as! NSDictionary
                let moment = Moment(json: row)
                if moment.isValid() {
                    moments.append(moment)
                }
            }
            factTableView.reloadData()
        } catch let error as NSError{
            print(error.description)
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = factTableView.dequeueReusableCellWithIdentifier("MomentCell", forIndexPath: indexPath) as! MomentTableCell
        let moment = moments[indexPath.row]
        cell.populate(moment)
        return cell
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moments.count
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == momentDetailSegue {
            let navigationController = segue.destinationViewController as! UINavigationController
            let momentDetailController = navigationController.viewControllers.first as! MomentDetailController
            momentDetailController.moment = selectedMoment
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.selectedMoment = moments[indexPath.row]
        self.performSegueWithIdentifier(momentDetailSegue, sender: self)
    }
    
    @IBAction func unwindToList(segue: UIStoryboardSegue) {
        
    }


}

