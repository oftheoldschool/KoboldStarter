import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

public struct KoboldStarterMacro: PeerMacro {
    public static func expansion(
        of node: AttributeSyntax,
        providingPeersOf declaration: some DeclSyntaxProtocol,
        in context: some MacroExpansionContext
    ) throws -> [DeclSyntax] {
        guard let classDecl = declaration.as(ClassDeclSyntax.self) else {
            return []
        }
        let className = classDecl.name.text
        let decl: DeclSyntax = """
        @_cdecl("kobold_register_app")
        public func kobold_register_app() -> UnsafeMutableRawPointer {
            let app = \(raw: className)()
            return Unmanaged.passRetained(app).toOpaque()
        }
        """
        return [decl]
    }
}

@main
struct KoboldStarterPlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        KoboldStarterMacro.self
    ]
}
