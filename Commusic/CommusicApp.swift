
import SwiftUI
import Firebase

@main
struct CommusicApp: App {
    @State private var isLoggedIn = UserDefaultsWorker.shared.getAccessToken() != nil
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            SplashScreen(isLoggedIn: $isLoggedIn)
        }
    }
}
