//
//  AppDelegate.swift
//  cuImageLauncher
//
//  Created by Lizhen Hu on 07/01/2017.
//  Copyright © 2017 Lizhen Hu. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Check whether the main application is already running.
        var isRunning = false
        let key = "MainBundleIdentifier"
        let mainBundleIdentifier = Bundle.main.infoDictionary![key] as! String
        let runningApplications = NSWorkspace.shared().runningApplications
        for app in runningApplications {
            if app.bundleIdentifier == mainBundleIdentifier {
                isRunning = true
                break
            }
        }
        
        if !isRunning {
            // Get absolute path of the main application.
            let pathComponents = Bundle.main.bundlePath.components(separatedBy: "/")
            let appPath = pathComponents[0..<pathComponents.count - 4].joined(separator: "/")
            
            // Launch the main application.
            NSWorkspace.shared().launchApplication(appPath)
        }
        
        // Terminate the launcher.
        NSApp.terminate(self)
    }
}
