//
//  ImagePicker.swift
//  ECE564_HW
//
//  Created by Nathan Ostrowski on 6/8/20, adapted from a view written by Kristijan Kralj.
//  Copyright © 2020 ECE564. All rights reserved.
//

import SwiftUI
import UIKit

struct ImagePicker: UIViewControllerRepresentable {
  
    @Binding var image: UIImage?
    @Binding var imageIsShown: Bool
  
    func makeCoordinator() -> Coordinator {
        return Coordinator(imageIsShown: $imageIsShown, image: $image)
    }
  
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }
  
    func updateUIViewController(_ uiViewController: UIImagePickerController,
        context: UIViewControllerRepresentableContext<ImagePicker>) {
    }
  
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        @Binding var image: UIImage?
        @Binding var imageIsShown: Bool
    
        init(imageIsShown: Binding<Bool>, image: Binding<UIImage?>) {
            _imageIsShown = imageIsShown
            _image = image
        }
    
        func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
            imageIsShown.toggle()
        }
    
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            imageIsShown.toggle()
        }
    }
}
