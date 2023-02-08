//
//  LoginView.swift
//  Commusic
//
//  Created by Bluyin  on 4/2/23.
//

import SwiftUI

struct LoginView: View {
   
    @State var textFieldEmail: String = ""
    @State var textFieldPassword: String = ""
    var body: some View {
        
        VStack{
            Group{
                Text("Commusic")
                    .bold()
            }
            .padding(.horizontal, 8)
            .multilineTextAlignment(.center)
            .font(.largeTitle)
            .tint(.primary)
            Group{
                
                TextField("Añade tu email", text: $textFieldEmail)
                    .foregroundColor(Color("description"))
                    .keyboardType(.emailAddress)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                   
                    
                SecureField("Añade tu contraseña", text: $textFieldPassword)
                    .foregroundColor(Color("description"))
                    .keyboardType(.emailAddress)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                                        
                Button("Aceptar"){
                    
                }
                .padding(.top, 18)
                .buttonStyle(.bordered)
                .tint(.blue)
                
            }
            
            .textFieldStyle(.roundedBorder)
            .padding(.horizontal, 64)
            
            Spacer()
            
            HStack {
                Button {
                    ()
                } label: {
                    Text("¿No tienes cuenta?")
                    Text("Regístrate")
                        .underline()
                }
                .tint(.blue)
            }
            
        }
        
        
        .background(Color("SurfaceBackground"))
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
