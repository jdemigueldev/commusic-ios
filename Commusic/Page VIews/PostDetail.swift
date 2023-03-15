
import SwiftUI

struct PostDetail: View {
    var post: Post
    
    var body: some View {
        
        VStack (spacing: 20){
            if post.photo?.content != nil {
                AsyncImage(url: URL(string: post.photo!.content)) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFill()
                            .clipped()
                            .cornerRadius(12)
                            .ignoresSafeArea(.all)
                    } else if phase.error != nil {
                        Text(phase.error?.localizedDescription ?? "error")
                            .foregroundColor(Color.pink)
                    } else {
                        ProgressView()
                    }
                }
                .frame(width:.infinity, height: 300)
                .padding(.bottom)
                
            }

            Text(post.title)
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            Text(post.user.username)
                .font(.footnote)
                .fontWeight(.semibold)
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
                .italic()
        
            Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
            
            Text(post.description)
                .fontWeight(.thin)
                .lineLimit(2)
                .minimumScaleFactor(0.5)
                .padding()
                .padding(.trailing)
                .padding(.leading)
            
            HStack (spacing: 40){
                
                
                //.font(.subheadline)
                //.foregroundColor(.secondary)
                
            }
            Spacer()
        }
        .preferredColorScheme(.dark)
    }
}

struct PostDetail_Previews: PreviewProvider {
    static var previews: some View {
        PostDetail(post: Post(id: 1, user_id: 1, title: "Hangeo", description: "Este es mi estudio, una pasada, busco chicos calientes que quieran grabar canciones de amor", price: 2, upload_date: "1/2", photo: Photo(id: 1, content: "https://www.culturasonora.es/wp-content/uploads/2019/02/que-es-un-estudio-para-musica-electronica-1024x683.jpg", order: 1), user: User(username: "juanito", email: "bluyin@example.com", full_name: "Bluyin Dev", profile_picture: "" )))
    }
}
