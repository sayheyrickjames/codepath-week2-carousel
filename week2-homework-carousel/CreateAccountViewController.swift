//
//  CreateAccountViewController.swift
//  week2-homework-carousel
//
//  Created by Rick James! Chatas on 5/14/15.
//  Copyright (c) 2015 SayHey. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController, UIAlertViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var createAccountView: UIView!
    
    @IBOutlet weak var createAccount2View: UIView!
    
    @IBOutlet weak var firstNameField: UITextField!
    
    @IBOutlet weak var lastNameField: UITextField!
    
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var termsCheckbox: UIButton!
    
    @IBOutlet weak var termsWebLink: UIButton!
    
    
    @IBOutlet weak var createButton: UIButton!
    
    var initialCenter : CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
        initialCenter = self.createAccount2View.center
        
        scrollView.contentSize = CGSize(width: 320, height: 504)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButton(sender: AnyObject) {
        navigationController!.popViewControllerAnimated(true)
    }
    
    @IBAction func termsSelect(sender: AnyObject) {
        termsCheckbox.selected = !termsCheckbox.selected
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        var userInfo = notification.userInfo!
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue().size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as! NSNumber
        var animationCurve = curveValue.integerValue
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions(UInt(animationCurve << 16)), animations: {
            // Set view properties in here that you want to match with the animation of the keyboard
            // If you need it, you can use the kbSize property above to get the keyboard width and height.
            
            self.createAccountView.frame.origin.y = -140
            self.createAccount2View.center.y = 218
            
            }, completion: nil)
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        var userInfo = notification.userInfo!
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue().size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as! NSNumber
        var animationCurve = curveValue.integerValue
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions(UInt(animationCurve << 16)), animations: {
            // Set view properties in here that you want to match with the animation of the keyboard
            // If you need it, you can use the kbSize property above to get the keyboard width and height.
            
            self.createAccountView.frame.origin.y = 0
            self.createAccount2View.center = self.initialCenter
            
            }, completion: nil)
    }
    
    @IBAction func accountCreated(sender: AnyObject) {
        
        if firstNameField.text == "" || lastNameField.text == "" || emailField.text == "" || passwordField.text == "" {
            
            var callAlertView = UIAlertView(title: "Hmm...", message: "Looks like something was left blank. Please fill out all fields.", delegate: self, cancelButtonTitle: "Go back")
            callAlertView.show()
            
        } else if termsCheckbox.selected.boolValue == false {
            
            var callAlertView = UIAlertView(title: "One more thing...", message: "Please accept the terms.", delegate: self, cancelButtonTitle: "Go back")
            callAlertView.show()
            
        } else {
            var alertView = UIAlertView(title: "Thank you. Creating your Dropbox...", message: nil, delegate: nil, cancelButtonTitle: nil)
            alertView.show()
            
            delay(2, { () -> () in
                alertView.dismissWithClickedButtonIndex(0, animated: true)
                self.performSegueWithIdentifier("accountCreated", sender: self)
            })
        }
        
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
