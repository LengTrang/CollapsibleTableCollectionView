//
//  CollapseableTableView.swift
//  CollapsableList
//
//  Created by Leng Trang on 4/3/16.
//  Copyright © 2016 Amarenthe. All rights reserved.
//

import UIKit
 
class CollapseableTableView: UITableViewController {
    
    let headerList : NSArray = ["One", "Two", "Three"]
    
    let headerOne : NSArray = ["A1", "A2", "A3", "A4", "A5", "A6", "A7"]
    let headerTwo : NSArray = ["B1", "B2", "B3"]
    let headerThree : NSArray = ["C1","C2", "C3", "C4"]
    
    var headerCount : NSMutableArray = []
    var
    headerCountConst : NSMutableArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.headerCount = [self.headerOne.count, self.headerTwo.count, self.headerThree.count]
        self.headerCountConst = [self.headerOne.count, self.headerTwo.count, self.headerThree.count]

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return self.headerList.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.headerCount[section] as! Int
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! CollapsableTableCell

        switch indexPath.section{
            case 0:
                cell.lblName.text = "\(self.headerOne[indexPath.row])"
                break
            case 1:
                cell.lblName.text = "\(self.headerTwo[indexPath.row])"
                break
            case 2:
                cell.lblName.text = "\(self.headerThree[indexPath.row])"
                break
            default:
                break
        }
        // Configure the cell...

        return cell
    }

    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let button: UIButton = UIButton(frame: CGRectMake(0, 0, self.view.frame.size.width, 50))
        button.setTitle("\(self.headerList[section])", forState: UIControlState.Normal)
        button.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        button.addTarget(self, action: #selector(CollapsableCollectionVC.headerEvent(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        button.backgroundColor = UIColor.blueColor()
        button.tag = section
        
       return button
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    @IBAction func headerEvent(sender: AnyObject){
        let temp = sender as! UIButton
        let index = NSIndexSet(index: temp.tag)
        
        self.headerCount[temp.tag] = self.headerCount[temp.tag].intValue == 0 ? self.headerCountConst[temp.tag] : 0
        
        self.tableView.reloadSections(index, withRowAnimation: UITableViewRowAnimation.None)
    }
}
