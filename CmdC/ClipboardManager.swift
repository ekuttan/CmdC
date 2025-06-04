import SwiftUI
import AppKit

struct ClipboardItem: Identifiable {
    let id = UUID()
    let item: NSPasteboardItem
    let display: String
}

class ClipboardManager: ObservableObject {
    @Published var items: [ClipboardItem] = []
    private var changeCount: Int = NSPasteboard.general.changeCount
    private var timer: Timer?

    init() {
        startMonitoring()
    }

    private func startMonitoring() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            self.checkForChanges()
        }
    }

    private func checkForChanges() {
        let pb = NSPasteboard.general
        guard pb.changeCount != changeCount else { return }
        changeCount = pb.changeCount
        if let newItem = pb.pasteboardItems?.first {
            var display = "Unknown"
            if let str = newItem.string(forType: .string) {
                display = String(str.prefix(40))
            } else if newItem.types.contains(.fileURL) {
                display = "File URL"
            } else if newItem.types.contains(.png) || newItem.types.contains(.tiff) {
                display = "Image"
            } else if let type = newItem.types.first {
                display = type.rawValue
            }
            let item = ClipboardItem(item: newItem, display: display)
            items.insert(item, at: 0)
            if items.count > 10 {
                items.removeLast()
            }
        }
    }

    func copy(_ item: ClipboardItem) {
        NSPasteboard.general.clearContents()
        NSPasteboard.general.writeObjects([item.item])
    }

    func clear() {
        items.removeAll()
        NSPasteboard.general.clearContents()
    }
}
