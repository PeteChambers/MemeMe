//
//  MemeEditorViewController.swift
//  Experiment1
//
//  Created by Pete Chambers on 25/10/2017.
//  Copyright © 2017 Pete Chambers. All rights reserved.
//

import UIKit

var meme: Meme!

class MemeEditorViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {

    @IBOutlet weak var bottomTextField: UITextField!
    @IBOutlet weak var topTextField: UITextField!
    @IBOutlet weak var CameraButton: UIBarButtonItem!
    
    @IBAction func Cancel(_ sender: Any) {
    self.dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController,didFinishPickingMediaWithInfo info: [String : Any]) {
    
        
        dismiss(animated: true, completion: nil)

        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            ImagePickerView.image = image
        }
        
    }
    // Function that can be used to choose the source type of a button
    
    func pick(sourceType: UIImagePickerControllerSourceType){
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = sourceType
        present(imagePicker, animated: true, completion: nil)
    }
    
    // Camera button - launches camera
    
    @IBAction func pickAnImageFromCamera(_ sender: Any) {
        pick(sourceType: .camera)
       
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {

        dismiss(animated: true, completion: nil)
        
    }
    // Formatting for top and bottom text fields
    let memeTextAttributes:[String:Any] = [
        NSAttributedStringKey.strokeColor.rawValue : UIColor.black,
        NSAttributedStringKey.foregroundColor.rawValue : UIColor.white,
        NSAttributedStringKey.font.rawValue : UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)!,
        NSAttributedStringKey.strokeWidth.rawValue : -4.0,
    ]
    func stylizeTextField(textField: UITextField) {
        textField.defaultTextAttributes = memeTextAttributes
        topTextField.defaultTextAttributes = memeTextAttributes
        bottomTextField.defaultTextAttributes = memeTextAttributes
        topTextField.textAlignment = .center
        bottomTextField.textAlignment = .center
            }
    @IBOutlet weak var ImagePickerView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.topTextField.delegate = self
        self.bottomTextField.delegate = self
   // assinging top and formatting to top and bottom text fields
        
        stylizeTextField(textField: topTextField)
        stylizeTextField(textField: bottomTextField)
    }

    override func viewWillAppear(_ animated: Bool) {
        CameraButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)

        
        super.viewWillAppear(animated)
        subscribeToKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated)
        unsubscribeFromKeyboardNotifications()
    }
     // functions for allowing keyboard to shift up when editing bottom text field but not top text field
    @objc func keyboardWillShow(_ notification:Notification) {
        
        
        if bottomTextField.isFirstResponder {
            view.frame.origin.y = 0 - getKeyboardHeight(notification)
        }
    }
   
    func subscribeToKeyboardNotifications() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: .UIKeyboardWillHide, object: nil)
    }
    
    func getKeyboardHeight(_ notification:Notification) -> CGFloat {
        
        let userInfo = notification.userInfo
        let keyboardSize = userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue // of CGRect
        return keyboardSize.cgRectValue.height
    }
    
  
    
    @objc func keyboardWillHide(_ notification:Notification) {
        
        view.frame.origin.y = 0
    }
    
    func unsubscribeFromKeyboardNotifications() {
        
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillHide, object: nil)
    }
    // Album button - allows user to pick image from photos
    @IBAction func pickAnImage(_ sender: Any){
    pick(sourceType: .photoLibrary)
        
}
    // save meme function
    func save(memedImage: UIImage) {
        // Create the meme
        let meme = Meme(topText: topTextField.text!, bottomText: bottomTextField.text!, origionalImage: ImagePickerView.image, memedImage: memedImage)
        
        // Add it to the memes array in the Application Delegate
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        appDelegate.memes.append(meme)
        
    }
    
    // generating a memed image - combining image and text
    func generateMemedImage() -> UIImage {
      
        navigationController?.navigationBar.isHidden = true
        navigationController?.toolbar.isHidden = true
    
        UIGraphicsBeginImageContext(self.view.frame.size)
        view.drawHierarchy(in: self.view.frame, afterScreenUpdates: true)
        let memedImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return memedImage
        
    }
    
    // Share button - brings up activty view
        @IBAction func shareButton(_ sender: UIBarButtonItem) {
            let memedImage = generateMemedImage()
            var memedImages = [UIImage]()
            memedImages.append(memedImage)
            let activityController = UIActivityViewController(activityItems: [memedImage] as [AnyObject], applicationActivities: nil)
            activityController.popoverPresentationController?.sourceView = self.view
            
            present(activityController, animated: true, completion: nil)
            
            activityController.completionWithItemsHandler = { (activity, success, items, error) in
                if success {
                    self.save(memedImage: memedImage)
                    self.dismiss(animated: true, completion: nil)
                }
                }
            
    }
    func textFieldShouldReturn(_ textField : UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

