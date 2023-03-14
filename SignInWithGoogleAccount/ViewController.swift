//
//  ViewController.swift
//  SignInWithGoogleAccount
//
//  Created by Kirill Romanenko on 14.03.2023.
//

import UIKit
import GoogleSignIn

class ViewController: UIViewController {
    
    private var signInButton: GIDSignInButton {
        let button = GIDSignInButton()
        button.frame.size = CGSize(width: self.view.frame.width / 3,
                                   height: CGFloat(100))
        button.center = self.view.center
        button.addTarget(self, action: #selector(signIn), for: .touchUpInside)
        return button
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(signInButton)
    }
    
    @objc func signIn(_ sender: GIDSignInButton){
        GIDSignIn.sharedInstance.signIn(withPresenting: self) { signInResult, error in
            guard error == nil else { return }
            guard let signInResult = signInResult else { return }
            
            let user = signInResult.user
            
            let emailAddress = user.profile?.email
            print(emailAddress ?? "email")
            let fullName = user.profile?.name
            print(fullName ?? "fullname")
            let givenName = user.profile?.givenName
            print(givenName ?? "givenName")
            let familyName = user.profile?.familyName
            print(familyName ?? "familyName")
            let profilePicUrl = user.profile?.imageURL(withDimension: 320)
        }
    }
    
}

