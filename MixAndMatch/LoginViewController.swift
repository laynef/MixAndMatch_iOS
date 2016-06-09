//
//  LoginViewController.swift
//  MixAndMatch
//
//  Created by Layne Faler on 6/8/16.
//  Copyright © 2016 Layne Faler. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate  {
    
    enum LoginErrors: ErrorType {
        case noUsername
        case noPassword
        case loginDoesntMatch
        case incorrectUsername
        case incorrectPassword
    }
    
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var usernameTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var enterButton: UIButton!
    @IBOutlet weak var rePasswordTextfield: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    
    var signUpActive: Bool = false
    var selectedTextField: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rePasswordTextfield.hidden = true
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        subscribeTheNotifications()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        unsubscribeTheNotifications()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "enterFromLogin" && signUpActive == false {
            do {
                if let username = usernameTextfield.text, let password = passwordTextfield.text {
                    if username == "" {
                        throw LoginErrors.noUsername
                    }
                    if password == "" {
                        throw LoginErrors.noPassword
                    }
                }
                
                
                // Firebase
                segue.destinationViewController as? MainMenuViewController
            } catch LoginErrors.noUsername {
                setupAlert("No Username", message: "Please enter a username.")
            } catch LoginErrors.noPassword {
                setupAlert("No Password", message: "Please enter a password.")
            } catch let error {
                fatalError("\(error)")
            }
        }
        
        if segue.identifier == "enterFromLogin" && signUpActive == true {
            do {
                if let username = usernameTextfield.text, let password = passwordTextfield.text, let repassword = rePasswordTextfield.text {
                    if username == "" {
                        throw LoginErrors.noUsername
                    }
                    if password == "" || repassword == "" {
                        throw LoginErrors.noPassword
                    }
                }
                segue.destinationViewController as? MainMenuViewController
            } catch LoginErrors.noUsername {
                setupAlert("No Username", message: "Please enter a username.")
            } catch LoginErrors.noPassword {
                setupAlert("No Password", message: "Please enter a password.")
            } catch let error {
                fatalError("\(error)")
            }
        }
    
    }

    @IBAction func signUpButtonPressed(sender: AnyObject) {
        rePasswordTextfield.hidden = false
        signUpButton.hidden = true
        signUpActive = true
    }
    
    func setupAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        let action = UIAlertAction(title: title, style: .Default, handler: nil)
        alertController.addAction(action)
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    
    func keyboardWillShow(notification: NSNotification) {
        UIView.animateWithDuration(0.8) {
            self.view.frame.origin.y = -self.getKeyboardHeight(notification)
            self.view.layoutIfNeeded()
        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        UIView.animateWithDuration(0.8) {
            self.view.frame.origin.y = 0
            self.view.layoutIfNeeded()
        }
    }
    
    func subscribeTheNotifications() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIKeyboardWillHideNotification, object: nil)
    }
    
    func unsubscribeTheNotifications() {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillHideNotification, object: nil)
    }
    
    func getKeyboardHeight(notification: NSNotification) -> CGFloat {
        let userInfo = notification.userInfo
        let keyboardSize = userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue
        return keyboardSize.CGRectValue().height
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        selectedTextField = textField
    }
    
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        selectedTextField = nil
        textField.resignFirstResponder()
        return true
    }
    
}
