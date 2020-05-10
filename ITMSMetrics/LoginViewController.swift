//
//  LoginViewController.swift
//  ITMSMetrics
//
//  Created by ademturkoglu on 9.05.2020.
//  Copyright © 2020 ademturkoglu. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var loginButton: LoginButton!
    @IBOutlet weak var formView: UIView!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var userNameFieldView: UIView!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordFieldView: UIView!
    @IBOutlet weak var hideButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        errorLabel.isHidden = true
        userNameTextField.delegate = self
        passwordTextField.delegate = self
        view.backgroundColor = UIColor.white
        
        formView.layer.shadowColor = UIColor.black.cgColor
        formView.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        formView.layer.shadowOpacity = 0.2
        formView.layer.shadowRadius = 17
        autoEnterUsername()
        hideKeyboard()

        // Do any additional setup after loading the view.
    }
    @IBAction func hideButtonAction(_ sender: Any) {
        if(passwordTextField.isSecureTextEntry == true){
                   passwordTextField.isSecureTextEntry = false
                   hideButton.setTitle("hide", for: UIControl.State.normal)
                   
               }else{
                   passwordTextField.isSecureTextEntry = true
                   hideButton.setTitle("show", for: UIControl.State.normal)
               }
    }
    func hideKeyboard(){
        let tab:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tab)
    }
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == userNameTextField {
            userNameFieldView.backgroundColor = UIColor.marineBlue
        }
        if textField == passwordTextField {
            passwordFieldView.backgroundColor = UIColor.marineBlue
            errorLabel.isHidden = true
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == userNameTextField {
            userNameFieldView.backgroundColor = UIColor.whiteTextField
        }
        if textField == passwordTextField {
            passwordFieldView.backgroundColor = UIColor.whiteTextField
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if (textField == userNameTextField)
        {
            userNameTextField.resignFirstResponder()
            passwordTextField.becomeFirstResponder()
        }else{
            textField.resignFirstResponder()
            //loginButtonAction(self)
            loginButton.isUserInteractionEnabled = false
            
        }
        return true
    }
    
    func autoEnterUsername(){
        if let userName = UserDefaults.standard.object(forKey: "userName") as? String{
            userNameTextField.text = userName
        }
    }

  

}
