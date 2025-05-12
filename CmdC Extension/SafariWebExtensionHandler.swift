import SafariServices
import UserNotifications
import os.log
import AppKit

class SafariWebExtensionHandler: NSObject, NSExtensionRequestHandling {
    private var eventMonitor: Any?
    
    override init() {
        super.init()
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { granted, error in
            if granted {
                os_log(.default, "Notification permission granted")
                // Show debug message on screen
                let notification = UNMutableNotificationContent()
                notification.title = "Debug"
                notification.body = "Notification permission granted"
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: notification, trigger: nil)
                UNUserNotificationCenter.current().add(request)
            }
        }
        
        // Set up keyboard shortcut monitoring
        eventMonitor = NSEvent.addGlobalMonitorForEvents(matching: .keyDown) { event in
            if event.modifierFlags.contains([.command, .shift]) && event.keyCode == 14 { // 14 is the key code for 'e'
                self.takeScreenshot()
            }
        }
    }
    
    private func takeScreenshot() {
        let task = Process()
        task.launchPath = "/usr/sbin/screencapture"
        task.arguments = ["-i", NSHomeDirectory() + "/Desktop/screenshot.png"]
        task.launch()
        
        // Show debug message on screen
        let notification = UNMutableNotificationContent()
        notification.title = "Debug"
        notification.body = "Screenshot taken"
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: notification, trigger: nil)
        UNUserNotificationCenter.current().add(request)
    }

    func beginRequest(with context: NSExtensionContext) {
        let item = context.inputItems[0] as! NSExtensionItem
        let message = item.userInfo?[SFExtensionMessageKey]
        os_log(.default, "Received message from browser.runtime.sendNativeMessage: %@", message as! CVarArg)
        
        // Show debug message on screen
        let notification = UNMutableNotificationContent()
        notification.title = "Debug"
        notification.body = "Received message: \(message as? String ?? "nil")"
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: notification, trigger: nil)
        UNUserNotificationCenter.current().add(request)
        
        let response = NSExtensionItem()
        response.userInfo = [ SFExtensionMessageKey: [ "Response": "Received" ] ]
        context.completeRequest(returningItems: [response], completionHandler: nil)
    }
}
