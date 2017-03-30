//
//  EventMonitor.swift
//  MenuBar
//
//  Created by Pluto Y on 26/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Cocoa

class EventMonitor {
    private var monitor: Any?
    private var mask: NSEventMask
    private var handler: (NSEvent?) -> ()
    
    public init(mask: NSEventMask, handler: @escaping (NSEvent?) -> ()) {
        self.mask = mask
        self.handler = handler
    }
    
    deinit {
        stop()
    }
    
    func start() {
        monitor = NSEvent.addGlobalMonitorForEvents(matching: mask, handler: handler)
    }
    
    func stop() {
        if monitor != nil {
            NSEvent.removeMonitor(monitor!)
        }
    }
}
