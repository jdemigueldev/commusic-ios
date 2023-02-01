

import Foundation

struct Post: Decodable, Hashable {
    var post_id: Int
    var user_id: Int
    var title: String
    var description: String
    var price: Int
    var upload_date: String
    //var image: String
    //var date: Date
}
