//
//  UIImageView+Extension.swift
//  meliapp-principal
//
//  Created by Arlid Henao Rueda on 18/10/23.
//

import Foundation
import UIKit

extension UIImageView {
    
    public func imageFromServerURL(
        urlString: String,
        placeHolderImage:UIImage)
    {
        if self.image == nil{
            self.image = placeHolderImage
        }
        URLSession.shared.dataTask(
            with: NSURL(
                string: urlString
            )! as URL, completionHandler: { (data, response, error) -> Void in
            if error != nil {
                return
            }
            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data!)
                self.image = image
            })
        }).resume()
    }
}
