import JWT

typealias Token = String

extension Token {
    func isExpired()throws {
        let receivedJWT = try JWT(token: self)
        try receivedJWT.verifyClaims([ExpirationTimeClaim(date: Date())])
    }
    
    func canVerifySigniture(withSigner signer: String)throws {
        let receivedJWT = try JWT(token: self)
        try receivedJWT.verifySignature(using: HS256(key: signer.bytes))
    }
    
    func verifyIssuer()throws {
        let receivedJWT = try JWT(token: self)
        let issuerClaim = IssuerClaim(string: "biosphere3")
        try receivedJWT.verifyClaims([issuerClaim])
    }
    
    func verify()throws {
        do { try self.isExpired() }
        catch { throw JWTFailure.tokenIsExpired }
        
        do { try self.verifyIssuer() }
        catch { throw JWTFailure.issuerVerificationFailed }
        
        do { try self.canVerifySigniture(withSigner: JWTConfig.signerKey) }
        catch { throw JWTFailure.signatureVerificationFailed }
    }
}
