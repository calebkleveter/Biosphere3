import JWT

extension User {
    func createPayload()throws -> JSON {
        guard let id = self.id?.int else {
            throw JWTError.createKey
        }
        let now = Date()
        let dateAsTimeDouble = now.timeIntervalSince1970
        let createdAt = Int(dateAsTimeDouble)
        let expiration = createdAt + JWTConfig.expirationTime
        let payload = JSON.init([
            "iss": "biosphere3",
            "iat": .number(.int(createdAt)),
            "userEmail": .string(self.email),
            "userId": .number(.int(id)),
            "expiration": .number(.int(expiration))
            ])
        return payload
    }
}