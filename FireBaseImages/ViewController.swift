//
//  ViewController.swift
//  FireBaseImages
//
//  Created by Marcus V. Ferraz on 2018-03-06.
//  Copyright © 2018 Marcus V. Ferraz. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var uploadImage: UIImageView!
    
    @IBOutlet weak var downloadImage: UIImageView!
    let fileName = "boat.jpg"
    var imageReference: StorageReference{
        return Storage.storage().reference().child("images")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func uploadButtonPressed(_ sender: UIButton) {
        guard let image = uploadImage.image else{
            print("Image not uploaded")
            return
        }
        
        guard let imageData = UIImageJPEGRepresentation(image, 1) else {
            print("Error ImageData")
            return
        }
        
        let uploadImageReference = imageReference.child(fileName)
        let uploadTask = uploadImageReference.putData(imageData, metadata: nil) { (metadata, error) in
            print(metadata ?? "No Metadata")
            print(error ?? "No Error")
        }
        uploadTask.observe(.progress) { (snapshot) in
            print(snapshot.progress ?? "No More Progress")
        }
        
        uploadTask.resume()
    }
    
    @IBAction func downloadButtonPressed(_ sender: UIButton) {
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

