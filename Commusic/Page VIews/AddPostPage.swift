
import SwiftUI

struct AddPostPage: View {
    
    @State var title: String = ""
    @State var description: String = ""
    @State var price: String = ""
    
    @State private var showMenu = false
    @State private var selectedOption: String?
    @State private var showImagePicker = false
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    var body: some View {
        VStack {
            HStack {
                Text("Publicando en Categoria")
            }
            .padding()
            .font(.title2)
            .fontWeight(.semibold)
            .navigationBarTitleDisplayMode(.inline)
            
            HStack {
                Button(action: {
                    self.showMenu.toggle()
                }) {
                    Image(systemName: "camera")
                        .font(.system(size: 24))
                }
                .padding()
                .actionSheet(isPresented: $showMenu) {
                    ActionSheet(title: Text("Selecciona una opción"), message: Text("Elige una opción de la lista"), buttons: [
                        .default(Text("Hacer una foto")) {
                            self.selectedOption = "Hacer una foto"
                            self.showImagePicker = true
                            self.sourceType = .camera
                        },
                        .default(Text("Seleccionar de la galería")) {
                            self.selectedOption = "Seleccionar de la galería"
                            self.showImagePicker = true
                            self.sourceType = .photoLibrary
                        },
                        .cancel()
                    ])
                }
            }
            VStack (spacing: 15){
                TextField("Title", text: $title)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(5)
                TextField("Description", text: $description)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(5)
                TextField("Price", text: $price)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(5)
                
                Button {
                    ()
                } label: {
                    Text("Submit")
                }
            }
            Spacer()
        }
        .padding(.top)
        .sheet(isPresented: $showImagePicker) {
            ImagePickerView(sourceType: self.sourceType)
        }
    }
}

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



struct AddPostPage_Previews: PreviewProvider {
    static var previews: some View {
        AddPostPage()
    }
}
