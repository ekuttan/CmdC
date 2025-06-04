# Copy Current URL Safari Extension

A simple Safari extension that allows you to quickly copy the current page URL using a keyboard shortcut. I was using Arc for last few months and got addicted to the Command Shift C for copying url, so I build the same on Safari while I moved back.

This repository includes a Swift Package manifest so the app can be built using Swift Package Manager.
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
