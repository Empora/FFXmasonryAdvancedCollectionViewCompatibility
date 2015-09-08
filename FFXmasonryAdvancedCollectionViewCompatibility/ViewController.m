//
//  ViewController.m
//  FFXmasonryAdvancedCollectionViewCompatibility
//
//  Created by Sebastian Boldt on 10.02.15.
//  Copyright (c) 2015 Empora. All rights reserved.
//

#import "ViewController.h"
#import <FFXCollectionViewMasonryLayout.h>
#import "TestPinnableView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.composedDatasource = [[AAPLComposedDataSource alloc]init];
    self.composedDatasource.defaultMetrics.padding = UIEdgeInsetsMake(8, 8, 8, 8);
    self.composedDatasource.defaultMetrics.interItemSpacing = 8;
    self.composedDatasource.defaultMetrics.numberOfColumns = 2;
    self.composedDatasource.defaultMetrics.rowHeight = AAPLRowHeightVariable;
    

    
    TestDatasource * testSource = [[TestDatasource alloc]init];
    testSource.defaultMetrics.padding = UIEdgeInsetsMake(10, 10, 200, 10); // top, left, bottom,right
    AAPLLayoutSupplementaryMetrics* testHeader = [testSource newFooterForSectionAtIndex:0];
    testHeader.shouldPin = YES;
    testHeader.height = 50;
    testHeader.inSection = NO;
    testHeader.backgroundColor = [UIColor whiteColor];
    testHeader.supplementaryViewClass = [TestPinnableView class];
    testHeader.configureView = ^(UICollectionReusableView *view, AAPLDataSource *dataSource, NSIndexPath *indexPath) {
        view.backgroundColor = [UIColor whiteColor];
    };
    
    TestDatasource * testSource2 = [[TestDatasource alloc]init];
    testSource2.defaultMetrics.padding = UIEdgeInsetsMake(0, 10, 20, 10); // top, left, bottom,right


    
    /*
    AAPLLayoutSupplementaryMetrics* testFooter = [testSource newFooterForSectionAtIndex:0];
    testFooter.shouldPin = YES;
    testFooter.height = 50;
    testFooter.inSection = NO;
    testFooter.backgroundColor = [UIColor whiteColor];
    testFooter.supplementaryViewClass = [TestPinnableView class];
    testFooter.configureView = ^(UICollectionReusableView *view, AAPLDataSource *dataSource, NSIndexPath *indexPath) {
        view.backgroundColor = [UIColor whiteColor];
    };*/
    
    [self.composedDatasource addDataSource:testSource];
    [self.composedDatasource addDataSource:testSource2];
    
    AAPLLayoutSupplementaryMetrics* testFooter = [self.composedDatasource newFooterForSectionAtIndex:0];
    testFooter.shouldPin = YES;
    testFooter.height = 50;
    testFooter.inSection = NO;
    testFooter.backgroundColor = [UIColor whiteColor];
    testFooter.supplementaryViewClass = [TestPinnableView class];
    testFooter.configureView = ^(UICollectionReusableView *view, AAPLDataSource *dataSource, NSIndexPath *indexPath) {
        view.backgroundColor = [UIColor whiteColor];
    };
    
    //[self.composedDatasource addDataSource:[[TestDatasource alloc]init]];
    
    // Assigning our datasource to colleciontViewDatasource
    self.collectionView.dataSource = self.composedDatasource;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
