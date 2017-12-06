//
//  RestaurantViewCell.swift
//  FoodTaskerMobile
//
//  Created by Leo Trieu on 9/23/16.
//  Copyright © 2016 Leo Trieu. All rights reserved.
//

import UIKit

class RestaurantViewCell: UITableViewCell {

    @IBOutlet weak var lbRestaurantName: UILabel!
    @IBOutlet weak var lbRestaurantAddress: UILabel!
    
    @IBOutlet weak var imgRestaurantLogo: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
