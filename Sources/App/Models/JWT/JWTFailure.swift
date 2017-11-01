import JWT

enum JWTFailure: Error, CustomStringConvertible {
    case signatureVerificationFailed
    case issuerVerificationFailed
    case tokenIsExpired
    case payloadCreationFailed
    case createJWTFailed
    case payloadParsingFailed
    
    var description: String {
        switch self {
        case .signatureVerificationFailed:
            return "Could not verify signature"
        case .issuerVerificationFailed:
            return "Could not verify JWT issuer"
        case .tokenIsExpired:
            return "Your token is expired"
        case .payloadCreationFailed:
            return "Error creating JWT payload"
        case .createJWTFailed:
            return "Error creating JWT token"
        case .payloadParsingFailed:
            return "Error parsing JWT payload"
        }
    }
}
