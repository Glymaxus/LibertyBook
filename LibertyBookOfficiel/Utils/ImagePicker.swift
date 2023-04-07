//
//  ImagePicker.swift
//  LibertyBookOfficiel
//
//  Created by bastien giat on 07/04/2023.
//

import Foundation
import UIKit
import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?
    @Binding var isPickerShowing: Bool
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = context.coordinator // coordinator is going to create an instance of the Coordinator class adn assign it to the delegate
        
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
}

class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var parent: ImagePicker
    
    init(_ picker: ImagePicker) {
        self.parent = picker
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // run the code when the user has selected an image
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            // we were able to ge tthe image
            DispatchQueue.main.async {
                self.parent.selectedImage = image
            }
        }
            // dismiss the picker
        parent.isPickerShowing = false
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // run code when the user has cancelled the image picker UI
        parent.isPickerShowing = false 
    }
}
