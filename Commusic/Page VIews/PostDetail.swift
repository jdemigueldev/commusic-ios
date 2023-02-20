
import SwiftUI

struct PostDetail: View {
    var post: Post
    
    var body: some View {
        
        VStack (spacing: 20){
            Spacer()
            
            if post.photo.content != nil {
                
                AsyncImage (url: URL(string: post.photo.content)) { phase in
                    if let image = phase.image {
                        image.resizable ()
                            .scaledToFill ()
                            .frame (width: 300, height: 300)
                            .clipped ()
                            .cornerRadius(12)
                            //.scaledToFit()
                        
                    } else if phase.error != nil {
                        
                        Text(phase.error?.localizedDescription ?? "error")
                            .foregroundColor (Color.pink)
                        
                    } else {
                        ProgressView ()
                            .frame (width: 150, height: 100)
                    }
                }
            }
            Text(post.user.username)
                .font(.footnote)
                .fontWeight(.semibold)
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
        
            Text(post.upload_date)
                .padding(.top, 6)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .lineLimit(1)
            
            Text(post.title)
                .font(.title2)
                .fontWeight(.semibold)
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
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
    }
}

struct PostDetail_Previews: PreviewProvider {
    static var previews: some View {
        PostDetail(post: Post(id: 1, user_id: 1, title: "Hangeo", description: "Este es mi estudio, una pasada, busco chicos calientes que quieran grabar canciones de amor", price: 2, upload_date: "4/3/3", photo: Photo(id: 1, content: "https://images.unsplash.com/photo-1598653222000-6b7b7a552625", order: 1), user: User(username: "juanito", email: "bluyin@example.com", full_name: "Bluyin Dev", profile_picture: "" )))
    }
}
