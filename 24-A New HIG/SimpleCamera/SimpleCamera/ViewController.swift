//
//  ViewController.swift
//  SwiftKata1-SimpleCamera
//
//  Created by Phil Wright on 11/25/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    let imagePicker = UIImagePickerController()
    
    @IBOutlet weak var imageView : UIImageView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        imagePicker.delegate = self
    }
    
    @IBAction func chooseImage() {
        
        if  UIImagePickerController.isSourceTypeAvailable(.Camera) {
            
            imagePicker.allowsEditing = true
            imagePicker.sourceType = .Camera
            self.presentViewController(imagePicker, animated: true, completion: nil)
        } else {
            // Camera Not Available
            
            imagePicker.allowsEditing = true
            imagePicker.sourceType = .PhotoLibrary
            self.presentViewController(imagePicker, animated: true, completion: nil)
        }
    }


    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        // Notice: UIImagePickerControllerEditedImage rather than UIImagePickerControllerOrginalImage
        
        if let pickedImage = info[UIImagePickerControllerEditedImage] as? UIImage {
            
            imageView.contentMode = .ScaleAspectFit
            imageView.image = pickedImage
            
            UIImageWriteToSavedPhotosAlbum(pickedImage, self, "image:didFinishSavingWithError:contextInfo:", nil)
            
        }
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func image(image: UIImage, didFinishSavingWithError error: NSError?, contextInfo:UnsafePointer<Void>) {
        
        if error == nil {
            let alertController = UIAlertController(title: "Saved!", message: "Your altered image has been saved to your photos.", preferredStyle: .Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            presentViewController(alertController, animated: true, completion: nil)
        } else {
            let alertController = UIAlertController(title: "Save error", message: error?.localizedDescription, preferredStyle: .Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            presentViewController(alertController, animated: true, completion: nil)
        }
    }
    
    func getDocumentsDirectory() -> NSString {
        
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }


}

