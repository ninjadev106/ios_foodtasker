//
//  Helpers.swift
//  FoodTaskerMobile
//
//  Created by Leo Trieu on 9/23/16.
//  Copyright © 2016 Leo Trieu. All rights reserved.
//

import Foundation

class Helpers {
    
    // Helper method to load image asynchronously
    
    static func loadImage(_ imageView: UIImageView,_ urlString: String) {
        let imgURL: URL = URL(string: urlString)!
        
        URLSession.shared.dataTask(with: imgURL) { (data, response, error) in
            
            guard let data = data, error == nil else { return}
            
            DispatchQueue.main.async(execute: {
                imageView.image = UIImage(data: data)
            })
            }.resume()
        
    }
    
    // Helper method to show activity indicator
    
    static func showActivityIndicator(_ activityIndicator: UIActivityIndicatorView,_ view: UIView) {
        
        activityIndicator.frame = CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0)
        activityIndicator.center = view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.whiteLarge
        activityIndicator.color = UIColor.black
        
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
    }
    
    // Helper method to hide activity indicator
    static func hideActivityIndicator(_ activityIndicator: UIActivityIndicatorView) {
        activityIndicator.stopAnimating()
    }
    
}
