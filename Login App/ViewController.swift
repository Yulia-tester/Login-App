//
//  ViewController.swift
//  Login App
//
//  Created by Юлия Дегтярева on 2025-03-27.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var envelopImageView: UIImageView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var emailLineView: UIView!
    @IBOutlet weak var lockImageView: UIImageView!
    @IBOutlet weak var passswordTextField: UITextField!
    @IBOutlet weak var passwordLineView: UIView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var dontHaveAccountLabel: UILabel!
    @IBOutlet weak var signupButton: UIButton!
    
    
    // MARK: - Properties
    private let activeColor = UIColor(named: "notes") ?? UIColor.gray
    private var email: String = ""
    private var password: String = ""
    
    private let mockEmail = "abc@gmail.com"
    private let mockPassword = "123456"
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLoginButton()
        emailTextField.delegate = self
        passswordTextField.delegate = self
        emailTextField.becomeFirstResponder()
    }
    
    //  MARK: - IBActions
    @IBAction func loginAction(_ sender: Any) {
        emailTextField.resignFirstResponder()
        passswordTextField.resignFirstResponder()
        
        if email.isEmpty {
            makeErrorField(textField: emailTextField)
        }
        
        if password.isEmpty {
            makeErrorField(textField: passswordTextField)
        }
        
        if email == mockEmail,
           password == mockPassword {
            performSegue(withIdentifier: "goToHomePage", sender: sender)
        } else {
            let alert = UIAlertController(title: "Error".localized,
                                          message: "Wrong password or e-mail".localized,
                                          preferredStyle: .alert)
            let action = UIAlertAction(title: "OK".localized,
                                       style: .default)
            alert.addAction(action)
            
            present(alert, animated: true)
        }
    }
    
    @IBAction func signupAction(_ sender: Any) {
        print("Signup")
    }
    
    //  MARK: - Private methods
    private func setupLoginButton() {
        loginButton.layer.shadowColor = activeColor.cgColor
        loginButton.layer.shadowOffset = CGSize(width: 0, height: 0)
        loginButton.layer.shadowOpacity = 0.4
        loginButton.layer.shadowRadius = 8
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text?.trimmingCharacters(in: .whitespacesAndNewlines),
        !text.isEmpty else { return }
        
        switch textField {
        case emailTextField:
            let isValidEmail = check(email: text)
            
            if isValidEmail {
                email = text
                envelopImageView.tintColor = .systemGray5
                emailLineView.backgroundColor = .systemGray5
            } else {
                makeErrorField(textField: textField)
            }
        case passswordTextField:
            let isValidPassword = check(password: text)
            
            if isValidPassword {
                password = text
                lockImageView.tintColor = .systemGray5
                passwordLineView.backgroundColor = .systemGray5
            } else {
                makeErrorField(textField: textField)
            }
        default:
            print("unknown textField")
        }
    }
    
    private func check(email: String) -> Bool {
        return email.contains("@") && email.contains(".")
    }
    
    private func check(password: String) -> Bool {
        return password.count >= 4
    }
    
    private func makeErrorField(textField: UITextField) {
        switch textField {
        case emailTextField:
            envelopImageView.tintColor = activeColor
            emailLineView.backgroundColor = activeColor
        case passswordTextField:
            lockImageView.tintColor = activeColor
            passwordLineView.backgroundColor = activeColor
        default:
            print("unknown textField")
        }
    }
}

