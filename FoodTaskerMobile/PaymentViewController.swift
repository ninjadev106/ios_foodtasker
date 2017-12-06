//
//  PaymentViewController.swift
//  FoodTaskerMobile
//
//  Created by Leo Trieu on 9/22/16.
//  Copyright © 2016 Leo Trieu. All rights reserved.
//

import UIKit
import Stripe

class PaymentViewController: UIViewController {

    @IBOutlet weak var cardTextField: STPPaymentCardTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func placeOrder(_ sender: AnyObject) {
        
        APIManager.shared.getLatestOrder { (json) in
            
            if json["order"]["status"] == nil || json["order"]["status"] == "Delivered" {
                // Processing the payment and create an Order
                
                let card = self.cardTextField.cardParams
                
                STPAPIClient.shared().createToken(withCard: card, completion: { (token, error) in
                    
                    if let myError = error {
                        print("Error:", myError)
                    } else if let stripeToken = token {
                        
                        APIManager.shared.createOrder(stripeToken: stripeToken.tokenId) { (json) in
                            Tray.currentTray.reset()
                            self.performSegue(withIdentifier: "ViewOrder", sender: self)
                        }
                    }
                })
            
            } else {
                // Showing an alert message.
                
                let cancelAction = UIAlertAction(title: "OK", style: .cancel)
                let okAction = UIAlertAction(title: "Go to order", style: .default, handler: { (action) in
                    self.performSegue(withIdentifier: "ViewOrder", sender: self)
                })
                
                let alertView = UIAlertController(title: "Already Order?", message: "Your current order isn't completed", preferredStyle: .alert)
                
                alertView.addAction(okAction)
                alertView.addAction(cancelAction)
                
                self.present(alertView, animated: true, completion: nil)
            }
        }
    }

}
