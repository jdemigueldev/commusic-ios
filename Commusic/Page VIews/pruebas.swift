import SwiftUI
import UIKit

struct PhotoPost: View {
    
    @State private var showingImagePicker = false
    @State private var image: UIImage?
    
    var body: some View {
        VStack {
            if image != nil {
                Image(uiImage: image!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else {
                //Text("Presiona el botón para seleccionar una imagen")
            }
            Button(action: {
                self.showingImagePicker = true
            }) {
                Text("Seleccionar imagen")
            }
        }
        .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
            ImagePicker(image: self.$image)
        }
    }
    
    func loadImage() {
        guard let inputImage = image else { return }
        // Aquí puedes realizar cualquier acción con la imagen seleccionada
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var image: UIImage?
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        
        let parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.image = uiImage
            }
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = .photoLibrary
        picker.allowsEditing = false
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
        // No se necesita hacer nada aquí
    }
}

struct PhotoPost_Previews: PreviewProvider {
    static var previews: some View {
        PhotoPost()
    }
}

