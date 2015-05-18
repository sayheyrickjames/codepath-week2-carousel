//
//  SignInViewController.swift
//  week2-homework-carousel
//
//  Created by Rick James! Chatas on 5/12/15.
//  Copyright (c) 2015 SayHey. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController, UIAlertViewDelegate {
    
    @IBOutlet weak var signInView: UIView!
    
    @IBOutlet weak var signIn2View: UIView!
    
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var signInButton: UIButton!
    
    var initialCenter : CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
        initialCenter = self.signIn2View.center
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButton(sender: AnyObject) {
        navigationController!.popViewControllerAnimated(true)
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
            
            self.signInView.frame.origin.y = -25
            self.signIn2View.center.y = 255
            
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
            
            self.signInView.frame.origin.y = 80
            self.signIn2View.center = self.initialCenter
            
            }, completion: nil)
    }
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
    @IBAction func pressedSignIn(sender: AnyObject) {
        
        if emailField.text.isEmpty || passwordField.text.isEmpty {
            var alertView = UIAlertView(title: "Hmm...", message: "That isn't working. Let's try again.", delegate: self, cancelButtonTitle: "Go back")
            alertView.show()
        }
            
        else
        {
            var loadingAlertView = UIAlertView(title: "Signing in...", message: nil, delegate: self, cancelButtonTitle: nil)
            loadingAlertView.show()
            
            delay(2) {
                if (self.emailField.text == "rchatas@icloud.com" && self.passwordField.text == "password")
                {
                    
                    loadingAlertView.dismissWithClickedButtonIndex(0, animated: true)
                    self.performSegueWithIdentifier("signInSegue", sender: nil)
                }
                    
                else
                {
                    loadingAlertView.dismissWithClickedButtonIndex(0, animated: true)
                    var wrongAlertView = UIAlertView(title: "Dang", message: "Looks like that was an incorrect email and password combination.", delegate: self, cancelButtonTitle: "Try again")
                    self.view.endEditing(true)
                    wrongAlertView.show()
                    
                }
            }
            
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
