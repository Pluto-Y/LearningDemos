//
//  ViewController.swift
//  TableView
//
//  Created by Pluto Y on 26/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, NSTableViewDataSource, NSTextFieldDelegate {
    
    var fruitsStr = ["apple", "banana", "orange", "watermelon"]

    @IBOutlet weak var textField: NSTextField!
    @IBOutlet weak var tableView: NSTableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    @IBAction func addFruit(_ sender: Any?) {
        let newFruit = textField.stringValue
        fruitsStr.append(newFruit)
        textField.stringValue = ""
        tableView.reloadData()
    }

    // MARK: DataSource
    func numberOfRows(in tableView: NSTableView) -> Int {
        return fruitsStr.count
    }
    
    func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any? {
        return fruitsStr[row]
    }
    
    // MARK: NSTextFieldDelegate
    override func controlTextDidEndEditing(_ obj: Notification) {
        addFruit(nil)
    }
}

