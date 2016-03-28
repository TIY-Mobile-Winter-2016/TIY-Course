//
//  UIImage+Base64String.swift
//
//  Created by Phil Wright on 3/23/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

import UIKit

extension UIImage {
    
    func stringFromImage(image: UIImage, compressionRatio: CGFloat = 0.1) -> String {
        var imgString: String = ""
        
        if let data = UIImageJPEGRepresentation(image, compressionRatio) {
            imgString = data.base64EncodedStringWithOptions([.Encoding64CharacterLineLength])
        }
        return imgString
    }
    
    func imageFromString(imageString: String) -> UIImage? {
        
        var image: UIImage?
        if let imageData = NSData(base64EncodedString:imageString, options:[.IgnoreUnknownCharacters]) {
            image = UIImage(data: imageData)
        }
        return image
    }
}