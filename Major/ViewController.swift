//
//  ViewController.swift
//  Major
//
//  Created by Darshan Marathe on 22/04/18.
//  Copyright © 2018 Darshan Marathe. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class ViewController: UIViewController {

    @IBOutlet weak var signinSelector: UISegmentedControl!
    
    @IBOutlet weak var siginLabel: UILabel!
    
    

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signinButton: UIButton!
   
    @IBOutlet weak var informationLabel: UILabel!
    
   
    @IBOutlet weak var informationTextField: UITextField!
    
    
    @IBOutlet weak var addButton: UIButton!
    
    
    var isSignIn:Bool = true
    
    
    override func viewDidLoad() {

        
        super.viewDidLoad()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

    @IBAction func signinSelectorChanged(_ sender: Any) {
        
        isSignIn = !isSignIn
        
        
        if isSignIn {
            siginLabel.text = "Sign In"
            signinButton.setTitle("Sign In", for: .normal)
    }
        
        else{
            siginLabel.text = "Register"
            signinButton.setTitle("Register", for: .normal)
            
        }
        
        
    }
    


    
    @IBAction func signinButtonPressed(_ sender: UIButton) {
    
        if let email = emailTextField.text, let pass = passwordTextField.text
        {
            
            
            if isSignIn {
                
                Auth.auth().signIn(withEmail: email, password: pass) { (user, error) in
                   
                    
                    if user != nil {
                        }}
                self.performSegue(withIdentifier: "goToAdd", sender: self)
                
            }
            else {
                self.performSegue(withIdentifier: "goToAdd", sender: self)
                
                Auth.auth().createUser(withEmail: email, password: pass) { (user, error) in
                    
                    if user != nil {
                        
                self.performSegue(withIdentifier: "goToAdd", sender: self)
                    
                    }
                    
                    else{
                        
                            self.performSegue(withIdentifier: "goToAdd", sender: self)
                    }
                    
                    
                    
                    
                }
                
            }
            
        }
        
        
      
    
    }
    
    
}




