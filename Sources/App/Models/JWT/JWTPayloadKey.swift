enum JWTPayloadKey {
    case email
    case id
    case expiration
    
    var key: String {
        switch self {
        case .email: return "userEmail"
        case .id: return "userId"
        case .expiration: return "exp"
        }
    }
}
