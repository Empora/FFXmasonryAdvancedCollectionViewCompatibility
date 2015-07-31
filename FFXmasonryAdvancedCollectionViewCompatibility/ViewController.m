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
    AAPLLayoutSupplementaryMetrics* testHeader = [testSource newHeaderForSectionAtIndex:0];
    testHeader.shouldPin = YES;
    testHeader.height = 50;
    testHeader.inSection = YES;
    testHeader.backgroundColor = [UIColor whiteColor];
    testHeader.padding = UIEdgeInsetsMake(32.0, 8.0, 1.0, 8.0);
    testHeader.supplementaryViewClass = [TestPinnableView class];
    testHeader.configureView = ^(UICollectionReusableView *view, AAPLDataSource *dataSource, NSIndexPath *indexPath) {
        view.backgroundColor = [UIColor whiteColor];
    };
    
    [self.composedDatasource addDataSource:testSource];
    [self.composedDatasource addDataSource:[[TestDatasource alloc]init]];
    
    // Assigning our datasource to colleciontViewDatasource
    self.collectionView.dataSource = self.composedDatasource;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
