//
//  LoginViewController.swift
//  DesignerApp
//
//  Created by Ming Gong on 6/19/15.
//  Copyright © 2015 gongmingqm10. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func login(sender: AnyObject) {
        let email = emailTextField.text
        let password = passwordTextField.text
        if email == "admin" && password == "123456" {
            
        } else {
            let alertController = UIAlertController(title: "Prompt", message: "Email or password is not correct", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            presentViewController(alertController, animated: true, completion: nil)
        }
    }

}
