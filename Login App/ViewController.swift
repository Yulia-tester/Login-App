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
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLoginButton()
    }
    
    //  MARK: - IBActions
    @IBAction func loginAction(_ sender: Any) {
        performSegue(withIdentifier: "goToHomePage", sender: sender)
    }
    
    @IBAction func signupAction(_ sender: Any) {
        print("Signup")
    }
    
    //  MARK: - Private methods
    private func setupLoginButton() {
        loginButton.layer.shadowColor = (UIColor(named: "notes") ?? UIColor.gray).cgColor
        loginButton.layer.shadowOffset = CGSize(width: 0, height: 0)
        loginButton.layer.shadowOpacity = 0.4
        loginButton.layer.shadowRadius = 8
        
    }
}

