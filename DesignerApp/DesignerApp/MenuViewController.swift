//
//  MenuViewController.swift
//  DesignerApp
//
//  Created by Ming Gong on 6/19/15.
//  Copyright © 2015 gongmingqm10. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet weak var loginStateLabel: UILabel!
    var loginStatus: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initLoginStatus()
    }
    
    private func initLoginStatus() {
        loginStatus = UserDefaultManager.sharedInstance.getLoginStatus()
        loginStateLabel.text = loginStatus ? "Log out" : "Log in"
    }
    
    @IBAction func unwindToMenu(segue: UIStoryboardSegue) {
        
    }
    
    @IBAction func tapLogin(sender: AnyObject) {
        if loginStatus {
            UserDefaultManager.sharedInstance.saveLoginStatus(false)
            initLoginStatus()
        } else {
            self.performSegueWithIdentifier("loginSegue", sender: self)
        }
    }
    
}
