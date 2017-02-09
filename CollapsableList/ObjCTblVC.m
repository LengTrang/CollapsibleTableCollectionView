//
//  ObjCTblBC.m
//  CollapsableList
//
//  Created by Leng Trang on 7/26/16.
//  Copyright © 2016 Amarenthe. All rights reserved.
//

#import "ObjCTblVC.h"
#import "ObjCTblCell.h"

@interface ObjCTblVC ()

@property (nonatomic, strong) NSArray *headerList, *sectionOne, *sectionTwo, *sectionThree;
@property (nonatomic, strong) NSMutableArray *headerCountTemp, *headerCount;

@end

@implementation ObjCTblVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _headerList = @[@"One", @"Two", @"Three"];
    
    _sectionOne = @[@"A1", @"A2", @"A3", @"A4", @"A5", @"A6", @"A7"];
    _sectionTwo = @[@"B1"];
    _sectionThree = @[@"C1",@"C2"];
    
    _headerCount = [@[@(_sectionOne.count), @(_sectionTwo.count), @(_sectionThree.count)] mutableCopy];
    _headerCountTemp = [@[@(_sectionOne.count), @(_sectionTwo.count), @(_sectionThree.count)] mutableCopy];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _headerList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_headerCountTemp[section] integerValue];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ObjCTblCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
        switch (indexPath.section){
        case 0:
            cell.nameLbl.text = [NSString stringWithFormat: @"%@", _sectionOne[indexPath.row]];
            break;
        case 1:
            cell.nameLbl.text = [NSString stringWithFormat: @"%@", _sectionTwo[indexPath.row]];
            break;
        case 2:
            cell.nameLbl.text = [NSString stringWithFormat: @"%@", _sectionThree[indexPath.row]];
            break;
        default:
            break;
        }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50;
}


- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
    [button setTitle:[NSString stringWithFormat:@"%@", self.headerList[section]] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(headerEvent:) forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundColor:[UIColor blueColor]];
    [button setTag: section];
    
    return button;
}

- (IBAction)headerEvent:(id)sender{
    UIButton *temp = sender;
    NSIndexSet *index = [NSIndexSet indexSetWithIndex:temp.tag];

    self.headerCountTemp[temp.tag] = [self.headerCountTemp[temp.tag] intValue] == 0 ? self.headerCount[temp.tag] : @(0);
    
    [self.tableView reloadSections:index withRowAnimation:UITableViewRowAnimationNone];
}

@end
