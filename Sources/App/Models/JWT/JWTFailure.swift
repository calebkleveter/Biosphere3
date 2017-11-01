import JWT

enum JWTFailure: Error, CustomStringConvertible {
    case signatureVerificationFailed
    case issuerVerificationFailed
    case tokenIsExpired
    case payloadCreationFailed
    case createJWTFailed
    
    var description: String {
        switch self {
        case .signatureVerificationFailed:
            return "Could not verify signature"
        case .issuerVerificationFailed:
            return "Could not verify JWT issuer"
        case .tokenIsExpired:
            return "Your token is expired"
        case .payloadCreationFaile:
            return "Error creating JWT payload"
        case .createJWTFailed:
            return "Error creating JWT token"
        }
    }
}
