# Copy Current URL Safari Extension

A simple Safari extension that allows you to quickly copy the current page URL using a keyboard shortcut. I was using Arc for last few months and got addicted to the Command Shift C for copying url, so I build the same on Safari while I moved back.

## Features

- Copy current page URL with Command+Shift+C keyboard shortcut
- Shows notification when URL is copied
- Works on all websites

## Technical Details

### Permissions Required
- clipboardWrite: For copying URLs to clipboard
- activeTab: To access current tab information
- notifications: To show copy confirmation
- scripting: For content script injection

### Version
1.0

### Background Script
Uses a non-persistent background script (background.js) for handling copy operations

### Commands
Default keyboard shortcut: Command+Shift+C

## Usage
1. Install the extension
2. Use Command+Shift+C to copy the current page URL
3. URL will be copied to clipboard with a confirmation notification

## CmdC macOS App
The clipboard history is stored by the CmdC menu bar application.

1. Open the project in Xcode and select the **CmdC** target.
2. Run or build the app. When it launches, a menu bar icon ("doc.on.clipboard") confirms it is running.
3. The Safari extension remains separate and can be enabled from Safari's preferences.
