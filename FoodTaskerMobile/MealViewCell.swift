//
//  MealViewCell.swift
//  FoodTaskerMobile
//
//  Created by Leo Trieu on 9/23/16.
//  Copyright © 2016 Leo Trieu. All rights reserved.
//

import UIKit

class MealViewCell: UITableViewCell {

    @IBOutlet weak var lbMealName: UILabel!
    @IBOutlet weak var lbMealShortDescription: UILabel!
    
    @IBOutlet weak var lbMealPrice: UILabel!
    
    @IBOutlet weak var imgMealImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
