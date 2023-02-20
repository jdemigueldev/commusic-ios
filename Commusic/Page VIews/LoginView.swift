
import SwiftUI

struct LoginView: View {
    
    @State var textFieldEmail: String = ""
    @State var textFieldPassword: String = ""
    var body: some View {
        
        NavigationView {
            VStack (spacing: 20){
                Group{
                    Text("Commusic")
                        .bold()
                    Text("Inicia sesión")
                        .font(.title3)
                        .fontWeight(.light)
                        .padding(.top, 4)
                    
                }
                .padding(.top, 20)
                .padding(.horizontal, 8)
                .multilineTextAlignment(.center)
                .font(.largeTitle)
                .tint(.primary)
                Group {
                    
                    TextField("Añade tu email", text: $textFieldEmail)
                        .foregroundColor(Color("description"))
                        .keyboardType(.emailAddress)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding(.leading, 50)
                    
                    SecureField("Añade tu contraseña", text: $textFieldPassword)
                        .foregroundColor(Color("description"))
                        .keyboardType(.emailAddress)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding(.leading, 50)
                    
                    
                    VStack {
                        NavigationLink(destination: RegisterView()) {
                            Text("Aceptar")
                        }.padding()
                    }
                    
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal, 64)
                    
                    Spacer()
                    
                    HStack
                    {
                        Text("¿No tienes cuenta?")
                            .fontWeight(.light)
                        Button {
                            ()
                        } label: {
                            
                            Text("Regístrate")
                                .underline()
                        }
                        .tint(.blue)
                    }
                    
                }
                //.background(Color("SurfaceBackground"))
            }
        }
        
    }
}
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
