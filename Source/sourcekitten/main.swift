//
//  main.swift
//  SourceKitten
//
//  Created by JP Simard on 2015-01-03.
//  Copyright (c) 2015 SourceKitten. All rights reserved.
//

#if os(Linux)
import Glibc
#else
import Darwin
#endif
import Commandant
import SourceKittenFramework

private func run() {
    let registry = CommandRegistry<SourceKittenError>()
    registry.register(CompleteCommand())
    registry.register(DocCommand())
    registry.register(FormatCommand())
    registry.register(IndexCommand())
    registry.register(SyntaxCommand())
    registry.register(StructureCommand())
    registry.register(VersionCommand())

    let helpCommand = HelpCommand(registry: registry)
    registry.register(helpCommand)

    registry.main(defaultVerb: "help") { error in
        fputs("\(error)\n", stderr)
    }
}

#if SWIFT_PACKAGE
    run()
#else
    // `sourcekitd_set_notification_handler()` sets the handler to be executed on main thread queue.
    // So, we vacate main thread to `dispatchMain()`.
    DispatchQueue.global(qos: .default).async {
        run()
    }
    dispatchMain()
#endif
