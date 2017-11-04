enum JWTPayloadKey {
    case email
    case username
    case id
    case expiration
    
    var key: String {
        switch self {
        case .email: return "userEmail"
        case .username: return "userUsername"
        case .id: return "userId"
        case .expiration: return "exp"
        }
    }
}
