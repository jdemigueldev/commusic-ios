
import SwiftUI

struct AddPostPage: View {
    let category: Category
    
    @State var title: String = ""
    @State var description: String = ""
    @State var price: Int?
    
    @State private var showMenu = false
    @State private var selectedOption: String?
    @State private var showImagePicker = false
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    var body: some View {
        VStack {
            
            HStack {
                Text("Publicando en :")
                Label(category.name, systemImage: category.systemImage)
                
                
            }
            .padding()
            .font(.title2)
            .fontWeight(.semibold)
            .navigationBarTitleDisplayMode(.inline)
            
            Rectangle()
                .frame(height: 1)
                .padding(.leading, 20)
                .padding(.trailing, 20)
                .foregroundColor(.gray)
                .padding(.bottom, 60)
            
            
            
            
            HStack {
                ForEach(0..<5) { _ in
                    ZStack {
                        Image(systemName: "camera")
                            .font(.system(size: 24))
                            .padding(10)
                        //.background(Color.white)
                            .clipShape(Circle())
                            .onTapGesture {
                                self.showMenu.toggle()
                            }
                        Circle()
                            .stroke(Color.gray, lineWidth: 2)
                            .frame(width: 48, height: 48)
                    }
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
            }
            
            
            VStack (spacing: 15){
                TextField("Title", text: $title)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(5)
                TextEditor(text: $description)
                    .scrollContentBackground(.hidden)
                    .background(Color(.systemGray6))
                    .frame(height: 200)
                    .cornerRadius(5)
                

                        TextField("Price", value: $price, format: .number )
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(5)
                        
                        Button {
                            let post = PostCreate(user_id: 1, title: title, description: description, price: price!)
                            Task {
                                do {
                                    try await createPost(post)
                                    
                                } catch {
                                    print("Error al crear el post: \(error.localizedDescription)")
                                }
                                
                            }
                        } label: {
                            Text("Submit")
                        }
                        .disabled(title.isEmpty || description.isEmpty || price == nil)
                        .tint(.green)
                        
                    }
                    .padding()
                    .buttonStyle(.bordered)
                Spacer()
            }
            .preferredColorScheme(.dark)
            .padding()
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
            AddPostPage(category: Category.sampleData[0])
        }
    }
