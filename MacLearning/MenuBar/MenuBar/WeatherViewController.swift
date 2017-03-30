//
//  WeatherViewController.swift
//  MenuBar
//
//  Created by Pluto Y on 26/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Cocoa

class WeatherViewController: NSViewController {
    
    class func loadFromXib() -> WeatherViewController {
        let storyboard = NSStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateController(withIdentifier: "WeatherViewController") as! WeatherViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
}
