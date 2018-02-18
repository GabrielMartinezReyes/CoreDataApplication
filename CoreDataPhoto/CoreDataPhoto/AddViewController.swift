//
//  AddViewController.swift
//  CoreDataPhoto
//
//  Created by Gabriel Martinez on 2018-02-18.
//  Copyright © 2018 Gabriel Martinez. All rights reserved.
//

import UIKit
import CoreData


class AddViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var titleField: UITextField!
    
    @IBOutlet weak var descriptionField: UITextField!
    
    @IBOutlet weak var imageView: UIImageView!
    
    var pc = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func dismissKeyboard(_ sender: Any) {
        self.resignFirstResponder()
    }
    
    
    
    
    @IBAction func camera(_ sender: Any) {
        
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = UIImagePickerControllerSourceType.camera
        pickerController.allowsEditing = true
        
        self.present(pickerController, animated: true, completion: nil)
    }
    
    @IBAction func library(_ sender: Any) {
        
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = UIImagePickerControllerSourceType.photoLibrary
        pickerController.allowsEditing = true
        
        self.present(pickerController, animated: true, completion: nil)
        
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            imageView.image = image
            
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func save(_ sender: Any) {
    
        let entityDescription = NSEntityDescription.entity(forEntityName: "Entity", in: pc)
        
        
        let item = Entity(entity: entityDescription!, insertInto: pc)
        
        item.titletext = titleField.text
        item.descriptiontext = descriptionField.text
        item.image = UIImagePNGRepresentation(imageView.image!) as NSData?
        
        do{
            
            try pc.save()
            
        }catch{
            print(error)
            return
        }
        navigationController!.popViewController(animated: true)
    }
    
    
    
    
    
    
    
    

}
