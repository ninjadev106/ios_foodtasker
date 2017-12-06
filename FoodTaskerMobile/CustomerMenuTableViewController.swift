//
//  CustomerMenuTableViewController.swift
//  FoodTaskerMobile
//
//  Created by Leo Trieu on 9/20/16.
//  Copyright © 2016 Leo Trieu. All rights reserved.
//

import UIKit

class CustomerMenuTableViewController: UITableViewController {

    @IBOutlet weak var imgAvatar: UIImageView!
    @IBOutlet weak var lbName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lbName.text = User.currentUser.name
        
        imgAvatar.image = try! UIImage(data: Data(contentsOf: URL(string: User.currentUser.pictureURL!)!))
        imgAvatar.layer.cornerRadius = 70 / 2
        imgAvatar.layer.borderWidth = 1.0
        imgAvatar.layer.borderColor = UIColor.white.cgColor
        imgAvatar.clipsToBounds = true
        
        view.backgroundColor = UIColor(red: 0.19, green: 0.18, blue: 0.31, alpha: 1.0)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "CustomerLogout" {
            
            APIManager.shared.logout(completionHandler: { (error) in
                
                if error == nil {
                    FBManager.shared.logOut()
                    User.currentUser.resetInfo()
                    
                    // Re-render the LoginView once you completed your loggin out process
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let appController = storyboard.instantiateViewController(withIdentifier: "MainController") as! LoginViewController
                    
                    let appDelegate = UIApplication.shared.delegate as! AppDelegate
                    appDelegate.window!.rootViewController = appController
                }
            })
            
            
        }
    }

}
