//
//  RegisterView.swift
//  Commusic
//
//  Created by Bluyin  on 15/2/23.
//

import SwiftUI

struct RegisterView: View {
    
    @State var username: String = ""
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        VStack (spacing: 20){
            Image("register")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.top, 50)
            Text("Register ")
                .bold()
                .font(.title)
            Text("Register")
            
            TextField("Username", text: $username)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(5)
            SecureField("Password", text: $password)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(5)
            TextField("Email", text: $email)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(5)
            Button {
                ()
            } label: {
                Text("Submit")
            }
        }
        .padding(.trailing, 30)
        .padding(.leading, 30)
        .padding(.bottom, 30)
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
