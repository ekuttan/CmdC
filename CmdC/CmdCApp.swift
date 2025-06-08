import SwiftUI
import AppKit

@main
struct CmdCApp: App {
    @StateObject private var manager = ClipboardManager()

    var body: some Scene {
        MenuBarExtra("CmdC", systemImage: "doc.on.clipboard") {
            ForEach(manager.items) { item in
                Button(item.display) {
                    manager.copy(item)
                }
            }
            Divider()
            Button("Clear History") { manager.clear() }
            Button("Quit") { NSApplication.shared.terminate(nil) }
        }
    }
}
