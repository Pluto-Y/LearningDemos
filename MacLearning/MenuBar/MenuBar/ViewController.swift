//
//  ViewController.swift
//  MenuBar
//
//  Created by Pluto Y on 26/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var imageView: NSImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = NSImage(named: "icon")
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

