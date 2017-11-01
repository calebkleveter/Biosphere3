import JWT

typealias Token = String

extension Token {
    var isExpired: Bool {
        do {
            let receivedJWT = try JWT(token: self)
            try receivedJWT.verifyClaims([ExpirationTimeClaim(date: Date())])
            return false
        } catch { return true }
    }
    
    func canVerifySigniture(withSigner signer: String) -> Bool {
        do {
            let receivedJWT = try JWT(token: self)
            try receivedJWT.verifySignature(using: HS256(key: signer.bytes))
            return true
        } catch { return false }
    }
    
    func verifyIssuer() -> Bool {
        do {
            let receivedJWT = try JWT(token: self)
            let issuerClaim = IssuerClaim(string: "biosphere3")
            try receivedJWT.verifyClaims([issuerClaim])
            return true
        } catch { return false }
    }
    
    func verify() -> Bool {
        let issuerVerified = self.verifyIssuer()
        let signitureVerified = self.canVerifySigniture(withSigner: JWTConfig.signerKey)
        
        if !self.isExpired && issuerVerified && signitureVerified {
            return true
        }
        return false
    }
}