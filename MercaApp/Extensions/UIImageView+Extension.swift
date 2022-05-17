//
//  UIImageView+Extension.swift
//  MercaApp
//
//  Created by Nicolas Chavez on 16/05/22.
//

import Foundation
import UIKit

extension UIImageView {
    
    public func imageFromServerURL(urlString: String, placeHolderImage:UIImage) {
        if self.image == nil{
            self.image = placeHolderImage
        }
        URLSession.shared.dataTask(with: NSURL(string: urlString)! as URL, completionHandler: { (data, response, error) -> Void in
            if error != nil {
                print(error ?? "No Error")
                return
            }
            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data!)
                self.image = image
            })
        }).resume()
    }
}
