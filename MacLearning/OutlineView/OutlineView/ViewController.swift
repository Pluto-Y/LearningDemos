//
//  ViewController.swift
//  OutlineView
//
//  Created by Pluto Y on 27/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, NSOutlineViewDelegate, NSOutlineViewDataSource {
    
    @IBOutlet weak var outlineView: NSOutlineView!
    @IBOutlet var treeController: NSTreeController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        addDatas()
    }
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    func addDatas() {
        let header: [String : Any] = [
            "name": "Library",
            "isLeaf": false
        ]
        let dic: NSMutableDictionary = NSMutableDictionary(dictionary: header)
        dic.setObject([PlayList(), PlayList()], forKey: ("children" as NSString))
        treeController.addObject(dic)
    }
    
    // MARK: - Helpers
    
    func isHeader(_ item: Any) -> Bool {
        if let item = item as? NSTreeNode  {
            return !(item.representedObject is PlayList)
        } else {
            return !(item is PlayList)
        }
    }
    
    // MARK: - Delegate
    func outlineView(_ outlineView: NSOutlineView, viewFor tableColumn: NSTableColumn?, item: Any) -> NSView? {
        if isHeader(item) {
            return outlineView.make(withIdentifier: "HeaderCell", owner: self)
        } else {
            return outlineView.make(withIdentifier: "DataCell", owner: self)
        }
    }
    
    
    
}

