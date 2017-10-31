import JWT

struct JWTConfig {
    static let signerKey = "smokey-atmosphere-38"
    static let headers = JSON(["type": "JWT", "alg": "HS256"])
}
