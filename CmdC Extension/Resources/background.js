function showToast(message) {
    // Create toast element
    const toast = document.createElement('div');
    toast.textContent = message;
    toast.style.cssText = `
        position: fixed;
        top: 20px;
        left: 50%;
        transform: translateX(-50%);
        background-color: rgba(0, 0, 0, 0.8);
        color: white;
        padding: 12px 24px;
        border-radius: 8px;
        z-index: 2147483647;
        font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
        font-size: 14px;
        transition: opacity 0.3s ease-in-out;
    `;

    // Inject toast into page
    document.body.appendChild(toast);

    // Fade out and remove after 2 seconds
    setTimeout(() => {
        toast.style.opacity = '0';
        setTimeout(() => {
            document.body.removeChild(toast);
        }, 300);
    }, 2000);
}

// Content script to inject
const script = {
    code: `(${showToast.toString()})`
};

browser.commands.onCommand.addListener((command) => {
    if (command === "copy-url") {
        browser.tabs.query({active: true, currentWindow: true}).then((tabs) => {
            const url = tabs[0].url;
            navigator.clipboard.writeText(url).then(() => {
                // Inject and execute the toast function in the active tab
                browser.tabs.executeScript(tabs[0].id, script).then(() => {
                    browser.tabs.executeScript(tabs[0].id, {
                        code: `(${showToast.toString()})("Link has been copied.")`
                    });
                });
                
                // Also show native notification
                browser.notifications.create({
                    type: 'basic',
                    title: 'URL Copied',
                    message: 'Current page URL has been copied to clipboard',
                    iconUrl: 'icon.png'
                });
            }).catch((err) => {
                console.error('Failed to copy URL:', err);
            });
        });
    }
});
