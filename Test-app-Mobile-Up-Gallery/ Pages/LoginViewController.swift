//
//  LoginViewController.swift
//  Test-app-Mobile-Up-Gallery
//
//  Created by Анастасия Перминова on 30.03.2022.
//

import UIKit

class LoginViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        headerLabel.text = "Mobile Up\nGallery"
        loginButton.layer.cornerRadius = 8
    }

    //MARK: - Actions
    @IBAction func logInTouch(_ sender: Any) {
    }
}
