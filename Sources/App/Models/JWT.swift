import JWT

struct JWTConfig {
    static let signerKey = "smokey-atmosphere-38"
    static let headers = JSON(["type": "JWT", "alg": "HS256"])
    static let signer = HS256(bytes: JWTConfig.signerKey.bytes)
    static let expirationTime = 1000
}
