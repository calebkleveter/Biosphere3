import JWT

extension User {
    func payload()throws -> JSON {
        guard let id = self.id?.int else {
            throw JWTFailure.payloadCreationFailed
        }
        let now = Date()
        let dateAsTimeDouble = now.timeIntervalSince1970
        let createdAt = Int(dateAsTimeDouble)
        let expiration = createdAt + JWTConfig.expirationTime
        let payload = JSON.init([
            "iss": "biosphere3",
            "iat": .number(.int(createdAt)),
            "userEmail": .string(self.email),
            "userUsername": .string(self.username),
            "userId": .number(.int(id)),
            "exp": .number(.int(expiration))
            ])
        return payload
    }
    
    func jwt()throws -> Token {
        do {
            let payload = try self.payload()
            let headers = JWTConfig.headers
            let signer = JWTConfig.signer
            let jwt = try JWT(headers: headers, payload: payload, signer: signer)
            let token = try jwt.createToken()
            return token
        } catch {
            throw JWTFailure.createJWTFailed
        }
    }
}
