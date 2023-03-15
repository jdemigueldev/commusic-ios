//
//  LoginPage.swift
//  Commusic
//
//  Created by Bluyin  on 15/2/23.
//

import SwiftUI

struct LoginPage: View {
    @Binding var isLoggedIn: Bool
    
    @State private var isPerformingLogin = false
    @State private var loginError = false
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
 
            VStack (spacing: 20){
                Image("loginpicture")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.top, 50)
                Text("Login")
                    .bold()
                    .font(.title)
                TextField("Username", text: $username)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(5)
                SecureField("Password", text: $password)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(5)
                
                if (loginError) {
                    Text("Invalid credentials")
                        .foregroundColor(.red)
                }
                
                Button(action: {
                    isPerformingLogin = true
                    
                    Task {
                        isLoggedIn = await logIn(login: Login(username: username, password: password))
                        isPerformingLogin = false
                        loginError = !isLoggedIn
                    }
                }, label: {
                    if (isPerformingLogin) {
                        ProgressView()
                    } else {
                        Text("Login")
                    }
                })
                .disabled(isPerformingLogin)
                .padding()
                .frame(maxWidth: .infinity)
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(5)
                
                Button("Register") {
                    
                }
                .padding()
                .frame(maxWidth: .infinity)
                .foregroundColor(.white)
                .overlay(RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.blue, lineWidth: 2))
            }.padding()
                .edgesIgnoringSafeArea(.bottom)
                //.background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
                .preferredColorScheme(.dark)
    }
}

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage(isLoggedIn: .constant(false))
    }
}
