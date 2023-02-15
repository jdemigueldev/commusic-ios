
import SwiftUI

struct Profile: View {
    var user: UserDetails
    @State var index = 0
    var body: some View {
        VStack {
            HStack (spacing: 15){
                Button(action: {
                    
                }) {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 22))
                        .foregroundColor(.black)
                }
                Text("Profile")
                    .font(.title)
                    .foregroundColor(Color("description"))
                Spacer(minLength: 0)
                
                Button(action: {
                    
                }){
                    Image(systemName: "pencil")
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 25)
                        .background(Color("backgroundpost"))
                        .cornerRadius(10)
                }
                
            }
            .padding()
            
            HStack {
                VStack(spacing: 0) {
                    Rectangle()
                    
                        .fill(Color("description"))
                        .padding(.leading, 25)
                        .frame(width: 100, height: 3)
                    
                    Image("profile")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .padding(.top, 6)
                        .padding(.bottom, 4)
                        .padding(.leading, 25)
                        .padding(.horizontal, 8)
                    
                    //.background(Color("description"))
                }
                VStack(alignment: .leading, spacing: 12) {
                    Text(user.username)
                        .font(.title)
                        .foregroundColor(Color("description"))
                    Text(user.full_name)
                        .font(.title2)
                        .foregroundColor(Color("description"))
                    
                    Text("Music Producer")
                        .foregroundColor(Color("description"))
                        .padding(.top, 8)
                    
                }
                .padding(.leading, 20)
                Spacer(minLength: 0)
                
            }
            
            
            ///Tab items
            HStack {
                Button(action: {
                    self.index = 0
                }) {
                    Text("Profile")
                        .foregroundColor(self.index == 0 ? Color.white: .gray)
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background(self.index == 0 ? Color("backgroundpost") : Color.clear)
                        .cornerRadius(10)
                }
                Spacer(minLength: 0)
                Button(action: {
                    self.index = 1
                }) {
                    Text("Notifications")
                        .foregroundColor(self.index == 1 ? Color.white: .gray)
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background(self.index == 1 ? Color("backgroundpost") : Color.clear)
                        .cornerRadius(10)
                }
                Spacer(minLength: 0)
                
                Button(action: {
                    self.index = 2
                }) {
                    Text("Saved")
                        .foregroundColor(self.index == 2 ? Color.white: .gray)
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background(self.index == 2 ? Color("backgroundpost") : Color.clear)
                        .cornerRadius(10)
                }
                
            }
            .padding(.horizontal, 8)
            .padding(.vertical, 5)
            //.background(Color.white)
            .cornerRadius(8)
            .shadow(color:Color.black.opacity(0.1),radius:5, x:8, y:8)
            //.shadow(color:Color.black.opacity(0.5),radius:5, x:-8, y:-8)
            .padding(.horizontal)
            .padding(.top, 10)
            
            VStack (spacing: 9){
                Text(user.description)
                    .padding()
                    .font(.body)
                    .foregroundColor(Color("description"))
                VStack {
                    Text(user.email)
                    
                }.padding(.trailing, 170)
                    .font(.body)
                    .foregroundColor(Color("description"))
                
            }
            
            Spacer(minLength: 0)
            
            
            
            Spacer(minLength: 0)
            
        }
        .background(Color("SurfaceBackground").edgesIgnoringSafeArea(.all))
        
    }
}

struct ProfilePage_Previews: PreviewProvider {
    static var previews: some View {
        Profile(user: UserDetails(id: 1, username: "MetroBoomin", email: "example@example.com", full_name: "metro", description: "I am a very professional producer who has worked with a lot of artists of the level of Alvarwu, in my social networks you can take a look at everything I do. ", birth_date: Date(), profile_picture: "", register_date: Date()))
    }
}
