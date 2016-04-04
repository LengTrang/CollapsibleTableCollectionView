//
//  CollapsableCollectionVCViewController.swift
//  CollapsableList
//
//  Created by Leng Trang on 4/3/16.
//  Copyright © 2016 Amarenthe. All rights reserved.
//

import UIKit

class CollapsableCollectionVCViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let headerList : NSArray = ["One", "Two", "Three"]
    
    let headerOne : NSArray = ["A1", "A2", "A3"]
    let headerTwo : NSArray = ["B1"]
    let headerThree : NSArray = ["C1","C2"]
    
    var headerCount : NSMutableArray = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CollectionCell", forIndexPath: indexPath) as! CollapsableCollectionCell
        
        
        
        return cell
    }

}
