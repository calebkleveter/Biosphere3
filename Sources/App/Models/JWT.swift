import JWT

struct JWTConfig {
    static let signerKey = "smokey-atmosphere-38"
    static let headers = JSON(["type": "JWT", "alg": "HS256"])
    static let signer = HS256(bytes: JWTConfig.signerKey.bytes)
    static let expirationTime = 1000
}

extension JWT {
    static func canVerifySigniture(fromToken token: String, withSigner signer: String) -> Bool {
        do {
            let receivedJWT = try JWT(token: token)
            try receivedJWT.verifySignature(using: HS256(key: signer.bytes))
            return true
        } catch { return false }
    }
}
