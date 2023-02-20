
import SwiftUI

struct PostCell: View {
    var post: Post
    
    var body: some View{
        HStack {
            
            if post.photo.content != nil {
                
                AsyncImage (url: URL(string: post.photo.content)) { phase in
                    if let image = phase.image {
                        image.resizable ()
                            .scaledToFill ()
                            .frame (width: 150, height: 100)
                            .clipped ()
                            .padding(.trailing, 20)
                            //.cornerRadius(12)
                        
                    } else if phase.error != nil {
                        
                        Text(phase.error?.localizedDescription ?? "error")
                            .foregroundColor (Color.pink)
                            .frame (width: 150, height: 100)
                            .padding(.trailing, 20)
                        
                    } else {
                        ProgressView ()
                            .frame (width: 150, height: 100)
                            .padding(.trailing, 20)
                    }
                    
                }
            }
                    VStack(alignment: .leading, spacing: 5) {
                        Text(post.title)
                            .fontWeight(.semibold)
                            .lineLimit(2)
                            .minimumScaleFactor(0.5)
                        
                        Text(post.user.full_name)
                            .fontWeight(.thin)
                            .lineLimit(2)
                            .minimumScaleFactor(0.5)
                        
                        Text(post.description)
                            .font(.body)
                            .lineLimit(3)
                            .minimumScaleFactor(0.5)
                        
                        Text(post.upload_date)
                            .padding(.top, 6)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .lineLimit(1)
                    }
                }
            }
        }
struct PostCell_Previews: PreviewProvider {
    static var previews: some View {
        PostListView()
    }
}
