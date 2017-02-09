//
//  ObjCColVC.m
//  CollapsableList
//
//  Created by Leng Trang on 7/26/16.
//  Copyright © 2016 Amarenthe. All rights reserved.
//

#import "ObjCColVC.h"
#import "ObjCColHeader.h"
#import "ObjCCollectionCell.h"

@interface ObjCColVC ()

@property (nonatomic, strong) NSArray *headerList, *sectionOne, *sectionTwo, *sectionThree;
@property (nonatomic, strong) NSMutableArray *headerCountTemp, *headerCount;

@end

@implementation ObjCColVC

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

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return _headerList.count;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return [_headerCountTemp[section] integerValue];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ObjCCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"objCell" forIndexPath:indexPath];
    
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

- (CGFloat)collectionView:(UICollectionView *)collectionView heightForHeaderInSection:(NSInteger)section{
    return 50;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{

    ObjCColHeader *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"objHeader" forIndexPath:indexPath];
    
    if (kind == UICollectionElementKindSectionHeader) {
        [headerView.nameBtn setTitle:_headerList[indexPath.section] forState:UIControlStateNormal];
        [headerView.nameBtn addTarget:self action:@selector(headerEvent:) forControlEvents:UIControlEventTouchUpInside];
        [headerView.nameBtn setBackgroundColor:[UIColor blueColor]];
        [headerView.nameBtn setTag: indexPath.section];
        return headerView;
    }else{
        return headerView;
    }
    
}


- (IBAction)headerEvent:(id)sender{
    UIButton *temp = sender;
    NSIndexSet *index = [NSIndexSet indexSetWithIndex:temp.tag];
    
    self.headerCountTemp[temp.tag] = [self.headerCountTemp[temp.tag] intValue] == 0 ? self.headerCount[temp.tag] : @(0);
    
    [self.collectionView reloadSections:index];
}

@end
