import JWT

/// Failure cases when creating, verfiying, or fetching data from a JWT token.
enum JWTFailure: Error, CustomStringConvertible {
    
    /// Signiture could not be verified.
    case signatureVerificationFailed
    
    /// Token issuer could not be verified.
    case issuerVerificationFailed
    
    /// The token has expired.
    case tokenIsExpired
    
    /// Payload could not be created.
    case payloadCreationFailed
    
    /// JWT token could not be created with the payload passed in.
    case createJWTFailed
    
    /// An error occured while getting data from a JWT payload.
    case payloadParsingFailed
    
    /// A human readable message of the error case.
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
