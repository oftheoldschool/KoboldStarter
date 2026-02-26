#if canImport(SwiftSyntaxMacros)
import SwiftSyntaxMacros
#endif

@attached(peer, names: named(kobold_register_app))
public macro KoboldStarter() = #externalMacro(module: "KoboldStarterImpl", type: "KoboldStarterMacro")
