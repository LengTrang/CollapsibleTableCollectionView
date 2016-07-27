//
//  CollapsableCollectionVCViewController.swift
//  CollapsableList
//
//  Created by Leng Trang on 4/3/16.
//  Copyright © 2016 Amarenthe. All rights reserved.
//

import UIKit

class CollapsableCollectionVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let headerList : NSArray = ["One", "Two", "Three"]
    
    let headerOne : NSArray = ["A1", "A2", "A3", "A4", "A5", "A6", "A7"]
    let headerTwo : NSArray = ["B1"]
    let headerThree : NSArray = ["C1","C2"]
    
    @IBOutlet weak var collectionView: UICollectionView!
    var headerCount : NSMutableArray = []
    var
    headerCountConst : NSMutableArray = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.headerCount = [self.headerOne.count, self.headerTwo.count, self.headerThree.count]
        self.headerCountConst = [self.headerOne.count, self.headerTwo.count, self.headerThree.count]

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return self.headerList.count
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.headerCount[section] as! Int
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CollectionCell", forIndexPath: indexPath) as! CollapsableCollectionCell
        switch indexPath.section {
        case 0:
            cell.lblName.text = "\(self.headerOne[indexPath.row])"
        case 1:
            cell.lblName.text = "\(self.headerTwo[indexPath.row])"
        case 2:
            cell.lblName.text = "\(self.headerThree[indexPath.row])"
        default:
            break
        }
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        
        switch kind{
        case UICollectionElementKindSectionHeader:
            
            let headerCell = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "header", forIndexPath: indexPath) as! CollectionHeader
            
            headerCell.titleBtn.setTitle("\(self.headerList[indexPath.section])", forState: UIControlState.Normal)
            headerCell.titleBtn.addTarget(self, action: #selector(CollapsableCollectionVC.headerEvent(_:)), forControlEvents: UIControlEvents.TouchUpInside)
            headerCell.titleBtn.tag = indexPath.section
            
            return headerCell
            
        default:
            assert(false, "Unexpected Error")
        }
    }

    @IBAction func headerEvent(sender: AnyObject){
        let temp = sender as! UIButton
        let index = NSIndexSet(index: temp.tag)
        
        self.headerCount[temp.tag] = self.headerCount[temp.tag].intValue == 0 ? self.headerCountConst[temp.tag] : 0
        
        self.collectionView.reloadSections(index)
    }
}
