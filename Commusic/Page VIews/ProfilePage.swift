
import SwiftUI

struct Profile: View {
    @State private var user: UserDetails?
    @State var index = 0
    var body: some View {
        VStack {
            HStack (spacing: 15){
                
                Text("Profile")
                    .font(.title)
                    .foregroundColor(Color("description"))
                    .padding(.leading,10)
                Spacer(minLength: 0)
                
                Button(action: {
                    
                }){
                    Image(systemName: "pencil")
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 25)
                        .background(Color("description"))
                        .cornerRadius(10)
                }
                
            }
            .padding()
            
            HStack {
                VStack(spacing: 0) {
                   
                    
                    Image("profile")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .padding(.top, 6)
                        .padding(.bottom, 4)
                        .padding(.leading, 10)
                        .padding(.horizontal, 8)
                    
                    //.background(Color("description"))
                }
                VStack(alignment: .leading, spacing: 12) {
                    Text(user?.username ?? "")
                        .font(.title)
                        .foregroundColor(Color("description"))
                    Text(user?.full_name ?? "")
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
                        .background(self.index == 0 ? Color("description") : Color.clear)
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
                        .background(self.index == 1 ? Color("description") : Color.clear)
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
                        .background(self.index == 2 ? Color("description") : Color.clear)
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
                Text(user?.description ?? "")
                    .padding()
                    .font(.body)
                    .foregroundColor(Color("description"))
                VStack {
                    Text(user?.email ?? "")
                        .padding(.leading)
                    
                }.padding(.trailing, 170)
                    .font(.body)
                    .foregroundColor(Color("description"))
                
            }
            
            Spacer(minLength: 0)
            
            
            
            Spacer(minLength: 0)
            
        }
        .task {
            user = await getLoggedUser()
        }
        //.background(Color("SurfaceBackground").edgesIgnoringSafeArea(.all))
        
    }
}

struct ProfilePage_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}
