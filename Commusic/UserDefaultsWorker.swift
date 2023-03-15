import Foundation

class UserDefaultsWorker {
    static let shared = UserDefaultsWorker()
    
    private static let KEY_ACCESS_TOKEN = "access_token"
    private static let KEY_ACCESS_TOKEN_TYPE = "token_type"
    private static let KEY_EXPIRY_DATE = "expires"
    
    func saveAuthToken(token: Token) {
        let defaults = UserDefaults.standard
        defaults.set(token.access_token, forKey: UserDefaultsWorker.KEY_ACCESS_TOKEN)
        defaults.set(token.token_type, forKey: UserDefaultsWorker.KEY_ACCESS_TOKEN_TYPE)
        defaults.set(token.expires, forKey: UserDefaultsWorker.KEY_EXPIRY_DATE)
    }
    
    func getAccessToken() -> Token? {
        guard let accessToken = UserDefaults.standard.object(forKey: UserDefaultsWorker.KEY_ACCESS_TOKEN) as? String else {
            return nil
        }
        guard let tokenType = UserDefaults.standard.object(forKey: UserDefaultsWorker.KEY_ACCESS_TOKEN_TYPE) as? String else {
            return nil
        }
        
        guard let expires = UserDefaults.standard.object(forKey: UserDefaultsWorker.KEY_EXPIRY_DATE) as? String else {
            return nil
        }
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
        let expireDate = formatter.date(from: expires)
        
        
        if (expireDate! <= Date.now) {
            return nil
        }
        
        return Token(access_token: accessToken, token_type: tokenType, expires: expires.description)
    }
}
