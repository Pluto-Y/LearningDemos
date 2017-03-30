//
//  PlayList.swift
//  OutlineView
//
//  Created by Pluto Y on 27/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Cocoa

class PlayList: NSObject {
    
    dynamic var name: String = "New PalyList"
    dynamic var creator: String = "User"

    func isLeaf() -> Bool {
        return true
    }
    
}
