import Vapor
import Fluent

typealias UserProject = Pivot<User, Project>

extension Config {
    func preparePivots() {
        self.preparations.append(UserProject.self)
    }
}
