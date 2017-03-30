//
//  AppDelegate.swift
//  MenuBar
//
//  Created by Pluto Y on 26/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    let statusBar = NSStatusBar.system().statusItem(withLength: NSVariableStatusItemLength)
    // 添加Menu
//    let menu = NSMenu()
    let popover = NSPopover()
    var eventMonitor: EventMonitor?

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        if let button = statusBar.button {
            print("statusBar button is available")
            button.image = NSImage(named: "icon2")
//            button.action = #selector(self.showWeather(_:))
            button.action = #selector(self.toggleWeather(_:))
        }
        
        // 添加 Menu
//        menu.addItem(NSMenuItem(title: "Show Weather", action: #selector(self.showWeather(_:)), keyEquivalent: "S"))
//        menu.addItem(NSMenuItem.separator())
//        let application = NSApplication.shared()
//        menu.addItem(NSMenuItem(title: "Quit", action: #selector(application.terminate(_:)), keyEquivalent: "q"))
//        
//        statusBar.menu = menu
        
        
        popover.contentViewController = WeatherViewController.loadFromXib()
        eventMonitor = EventMonitor(mask: [.leftMouseUp, .rightMouseUp], handler: { (event) in
           self.closePopover()
        })
        
    }
    
    func showPopover() {
        if let button = statusBar.button {
            popover.show(relativeTo: button.bounds, of: button, preferredEdge: .minY)
        }
        eventMonitor?.start()
    }
    
    func closePopover() {
        popover.close()
        eventMonitor?.stop()
 
    }

//    func showWeather(_ sender: NSStatusBarButton) {
//        print("Sunshine")
//    }
    
    func toggleWeather(_ sender: NSStatusBarButton) {
        if popover.isShown {
            closePopover()
        } else {
            showPopover()
        }
    }


}

