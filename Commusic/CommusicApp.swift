
import SwiftUI
import Firebase

@main
struct CommusicApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            LoginPage()
        }
    }
}
