# Copy Current URL Safari Extension

A simple Safari extension that allows you to quickly copy the current page URL using a keyboard shortcut. I was using Arc for last few months and got addicted to the Command Shift C for copying url, so I build the same on Safari while I moved back.

## Features

- Copy current page URL with Command+Shift+C keyboard shortcut
- Shows notification when URL is copied
- Works on all websites
- **New:** macOS menu bar clipboard manager shows last 10 copied items and lets you copy them again or clear the history

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
4. Access clipboard history from the CmdC menu bar icon
