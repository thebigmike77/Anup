//
//  login.swift
//  Anup
//
//  Created by Michael BECK on 10/13/15.
//  Copyright (c) 2015 Euro Management Consulting S.A. All rights reserved.
//

import UIKit



class login: UIViewController,UITextFieldDelegate  {
    
    @IBOutlet weak var txtUsername: UITextField!
 
    @IBOutlet weak var txtPassword: UITextField!

    @IBOutlet weak var statusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // #pragma mark - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func signinTapped(sender: UIButton) {

        var username:NSString = txtUsername.text
        var password:NSString = txtPassword.text
        
        if ( username.isEqualToString("") || password.isEqualToString("") ) {
            
            var alertView:UIAlertView = UIAlertView()
            alertView.title = "Sign in Failed!"
            alertView.message = "Please enter Username and Password"
            alertView.delegate = self
            alertView.addButtonWithTitle("OK")
            alertView.show()
        } else {
            
            
            
            // 1
            
            let urlAsString = "http://admin.a4c.us/users/login?field_value=\(username)&password=\(password)&remember=true&driver-side=1"
            
            let url = NSURL(string: urlAsString)!
            let urlSession = NSURLSession.sharedSession()
            
            //2
            let jsonQuery = urlSession.dataTaskWithURL(url, completionHandler: { data, response, error -> Void in
                if (error != nil) {
                    println(error.localizedDescription)
                }
                var err: NSError?
                
                // 3
                var jsonResult = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &err) as! NSDictionary
                if (err != nil) {
                    println("JSON Error \(err!.localizedDescription)")
                }
                
                // 4
                
                 println(jsonResult)
                let result = jsonResult["result"] as! Int
                
               println(result)
           
                
                if result == 0{
                    
                    self.statusLabel.text = "You do not have an account"
                    
                     }else {
                    
                 let customer = jsonResult["customer"] as! Int
                
                if customer != 1 {
                
                 self.statusLabel.text = "You do not have a customer account"
                    
                     } else {
                    
                    //save the login somewhere and dismiss
                    
                    println("ok")
                    
                     }
                   
                }
            })
            // 5
            jsonQuery.resume()
        }
            
            
               }
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {   //delegate method
        textField.resignFirstResponder()
        return true
    }
