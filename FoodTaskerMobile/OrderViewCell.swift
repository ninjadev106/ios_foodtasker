//
//  OrderViewCell.swift
//  FoodTaskerMobile
//
//  Created by Leo Trieu on 9/25/16.
//  Copyright © 2016 Leo Trieu. All rights reserved.
//

import UIKit

class OrderViewCell: UITableViewCell {

    @IBOutlet weak var lbQty: UILabel!
    @IBOutlet weak var lbMealName: UILabel!
    @IBOutlet weak var lbSubTotal: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
