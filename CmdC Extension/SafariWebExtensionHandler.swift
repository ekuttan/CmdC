import SafariServices
import UserNotifications
import os.log

class SafariWebExtensionHandler: NSObject, NSExtensionRequestHandling {
    override init() {
        super.init()
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { granted, error in
            if granted {
                os_log(.default, "Notification permission granted")
            }
        }
    }

    func beginRequest(with context: NSExtensionContext) {
        let item = context.inputItems[0] as! NSExtensionItem
        let message = item.userInfo?[SFExtensionMessageKey]
        os_log(.default, "Received message from browser.runtime.sendNativeMessage: %@", message as! CVarArg)
        let response = NSExtensionItem()
        response.userInfo = [ SFExtensionMessageKey: [ "Response": "Received" ] ]
        context.completeRequest(returningItems: [response], completionHandler: nil)
    }
}
