//
//  ImagePicker.swift
//  Commusic
//
//  Created by Bluyin  on 23/2/23.
//
import UIKit
import Foundation

struct ImagePickerView: UIViewControllerRepresentable {
    
    var sourceType: UIImagePickerController.SourceType
    
    func makeCoordinator() -> ImagePickerView.Coordinator {
        return Coordinator(parent: self)
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePickerView>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = sourceType
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePickerView>) {
        
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
        let parent: ImagePickerView
        
        init(parent: ImagePickerView) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            picker.dismiss(animated: true)
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true)
        }
    }
    
}
