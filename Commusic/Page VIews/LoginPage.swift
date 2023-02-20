//
//  LoginPage.swift
//  Commusic
//
//  Created by Bluyin  on 15/2/23.
//

import SwiftUI

struct LoginPage: View {
    
    @State var username: String = ""
    @State var password: String = ""
    
    var body: some View {
        NavigationView {
            VStack (spacing: 20){
                Image("loginpicture")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.top, 50)
                
                Text("Login")
                    .bold()
                    .font(.title)
                Text("The new era of music and people")
                    .font(.subheadline)
                
                TextField("Username", text: $username)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(5)
                SecureField("Password", text: $password)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(5)
                
                VStack (spacing: 30){
                    NavigationLink(destination: ContentView()) {
                        HStack {
                            Spacer()
                            Text("Login")
                                .foregroundColor(.white)
                            Spacer()
                        }.padding()
                            .background(Color.blue)
                            .cornerRadius(5)
                    }
                    Button {
                        ()
                    } label: {
                        Text("¿ Forgot password ?")
                            .foregroundColor(.blue)
                    }
                    NavigationLink(destination: RegisterView()) {
                        VStack {
                            Spacer()
                            Text("Register")
                                .foregroundColor(.blue)
                                .underline()
                                .padding(.top, 150)
                            Spacer()
                        }.padding()
                            
                            .cornerRadius(5)
                    }
                }
            }.padding()
        }
    }
}

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}
