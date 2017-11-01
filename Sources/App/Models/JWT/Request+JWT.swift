import HTTP

extension Request {
    var token: String {
        if let token = self.headers["Authorization"]?.string {
            return token
        }
        return ""
    }
}
