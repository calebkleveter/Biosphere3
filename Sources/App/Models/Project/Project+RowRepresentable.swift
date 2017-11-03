import Fluent

extension Project: RowRepresentable {
    func makeRow() throws -> Row { return Row() }
}
