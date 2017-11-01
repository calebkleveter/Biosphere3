enum JWTPayloadKey {
    case email
    case id
    case expiration
    
    var key: String {
        switch self {
        case .email: return "email"
        case .id: return "id"
        case .expiration: return "expiration"
        }
    }
}
