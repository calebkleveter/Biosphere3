import HTTP

extension Request {
    /// Get the JWT token held in a request's 'Authorization' header.
    var token: String {
        if let token = self.headers["Authorization"]?.string {
            return token
        }
        return ""
    }
}
