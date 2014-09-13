//
//  SignInViewController.swift
//  w2hw
//
//  Created by Jeff Conniff on 9/9/14.
//  Copyright (c) 2014 jconniff. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var inputContainer: UIView!
    @IBOutlet weak var loginText: UIImageView!
    
    @IBAction func btnCancelTouchUp(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func tapGesture(sender: AnyObject) {
        view.endEditing(true);  //close keyboard
    }
    @IBAction func signInBtnTouchUp(sender: AnyObject) {
//        var alertViewSigning = UIAlertView(title: "", message: "Signing In", delegate: self, cancelButtonTitle: "")
        var alertViewSigning = UIAlertView(title: "", message: "Signing In", delegate: self, cancelButtonTitle: nil)
        
        //alertViewSigning.show()
        
        if ((self.emailField.text == "") || (self.passwordField.text == "")) {
            var alertView = UIAlertView(title: "Sign in failed", message: "Email and Password required", delegate: self, cancelButtonTitle: "OK")
            alertView.show()
        } else {
            alertViewSigning.show()
            // Delay for 2 seconds, then run the code between the braces.
            delay(2) {
                
                // kill signing in message before conditional code
                alertViewSigning.dismissWithClickedButtonIndex(0, animated: true)
                
                
                if ((self.emailField.text == "a") && (self.passwordField.text == "b"))  {
                    // get rid of the UIAlertView
                    self.doSegue()
                } else {
                    var alertView = UIAlertView(title: "Ooops...", message: "Incorrect Email or Password", delegate: self, cancelButtonTitle: "OK")
                    alertView.show()
                }
            }
        }
        
    }
    func doSegue() {
        performSegueWithIdentifier("signedInSegue", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    func keyboardWillShow(notification: NSNotification!) {
        var userInfo = notification.userInfo!
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue().size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as NSNumber
        var animationCurve = curveValue.integerValue
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions.fromRaw(UInt(animationCurve << 16))!, animations: {
            
            // Set view properties in here that you want to match with the animation of the keyboard
            // If you need it, you can use the kbSize property above to get the keyboard width and height.
            self.inputContainer.frame = CGRectMake(0,
                self.view.frame.size.height - kbSize.height - self.inputContainer.frame.size.height - 10,
                self.inputContainer.frame.size.width, self.inputContainer.frame.size.height);

            self.loginText.frame = CGRectMake(0, 0,
                self.view.frame.size.width, self.loginText.frame.size.height)
            
            }, completion: nil)
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        var userInfo = notification.userInfo!
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue().size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as NSNumber
        var animationCurve = curveValue.integerValue
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions.fromRaw(UInt(animationCurve << 16))!, animations: {
            
            // Set view properties in here that you want to match with the animation of the keyboard
            // If you need it, you can use the kbSize property above to get the keyboard width and height.
            self.inputContainer.frame = CGRectMake(0, 194,
                self.inputContainer.frame.size.width,
                self.inputContainer.frame.size.height);

            self.loginText.frame = CGRectMake(0, 64,
                self.view.frame.size.width, self.loginText.frame.size.height)
            

            
            }, completion: nil)
    }    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
