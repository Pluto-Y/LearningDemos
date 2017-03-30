//
//  ViewController.swift
//  CollectionView
//
//  Created by Pluto Y on 26/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, NSCollectionViewDataSource{

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        let cell = collectionView.makeItem(withIdentifier: "LabelCollectionViewItem", for: indexPath)
        return cell
    }


}

