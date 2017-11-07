import Vapor

final class ProjectController {
    let drop: Droplet
    
    init(drop: Droplet) {
        self.drop = drop
    }
    
    func configureRoutes() {
        // Add controller routes to `project` droplet route group.
        let project = drop.grouped("project").grouped(APIErrorMiddleware())
        
        // Add private controller routes to `protected` droplet route group
        let protected = project.grouped(JWTMiddleware())
        protected.post("create", handler: create)
    }
    
    func create(_ request: Request)throws -> ResponseRepresentable {
        // Get data needed for finding a user and creating a project.
        guard let name = request.data["name"]?.string,
              request.token != "",
              let tokenId = try Int(request.token.get(.id))
              else {
                // Data missing. Abort.
                throw Abort.missingRequestData
        }
        
        // Created an identifier from the tokenId and get the matching user.
        let id: Identifier = Identifier.number(.int(tokenId))
        guard let user = try User.find(id) else {
            throw Abort.badUserID
        }
        
        // Create a project with the name and user that were found
        let project = Project(name: name, user: user)
        try project.save()
        return try JSON(node:
            ["data":
                ["name": project.name,
                 "user_id": user.id ?? "null"]
            ])
    }
}
