//
//  ViewController.swift
//  OpenInvite
//
//  Created by Riley Norris on 1/26/19.
//  Copyright © 2019 Riley Norris. All rights reserved.
//

import UIKit
import SCSDKLoginKit
import SCSDKBitmojiKit

class LogInController: UIViewController {
    
    let bitmojiView: SCSDKBitmojiIconView! = SCSDKBitmojiIconView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let loginButton: SCSDKLoginButton! = SCSDKLoginButton() { (success : Bool, error : Error?) in
            DispatchQueue.main.sync {
                Snapchat.retrieveData(completion: { _ in 
                    DispatchQueue.main.sync {
                        notificationFeedback.notificationOccurred(.success)
                        self.performSegue(withIdentifier: "toFeed", sender: nil)
                    }
                })
            }
        }
        
        self.view.addSubview(loginButton)
        self.view.addSubview(bitmojiView)
        
        ConstraintHelper.set(on: loginButton, to: self.view, type: .leading, constant: 25)
        ConstraintHelper.set(on: loginButton, to: self.view, type: .trailing, constant: -25)
        ConstraintHelper.set(on: loginButton, to: self.view, type: .centerX, constant: 0)
        ConstraintHelper.set(on: loginButton, to: self.view, type: .bottom, constant: -75)
        ConstraintHelper.set(on: loginButton, to: nil, type: .height, constant: 50)
        
        ConstraintHelper.set(on: bitmojiView, to: self.view, type: .centerX, constant: 0)
        ConstraintHelper.set(on: bitmojiView, to: nil, type: .width, constant: 85)
        ConstraintHelper.set(on: bitmojiView, to: nil, type: .height, constant: 85)
        ConstraintHelper.set(on: bitmojiView, to: self.view, type: .top, constant: 95)
        
    }
}

