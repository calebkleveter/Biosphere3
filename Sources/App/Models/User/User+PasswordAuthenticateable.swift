import AuthProvider
import BCrypt

extension User: PasswordAuthenticatable {
    var hashedPassword: String? {
        return self.password
    }
    
    public static var passwordVerifier: PasswordVerifier? {
        return hasher
    }
}
