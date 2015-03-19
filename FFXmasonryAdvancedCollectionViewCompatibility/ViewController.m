//
//  ViewController.m
//  FFXmasonryAdvancedCollectionViewCompatibility
//
//  Created by Sebastian Boldt on 10.02.15.
//  Copyright (c) 2015 Empora. All rights reserved.
//

#import "ViewController.h"
#import <FFXCollectionViewMasonryLayout.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupDatasources];
    self.composedDatasource = [[AAPLComposedDataSource alloc]init];
    [self.composedDatasource addDataSource:self.dataSource];
    self.composedDatasource.defaultMetrics.padding = UIEdgeInsetsMake(8, 8, 8, 8);
    self.composedDatasource.defaultMetrics.interItemSpacing = 8;
    // Assigning our datasource to colleciontViewDatasource
    self.collectionView.dataSource = self.composedDatasource;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setupDatasources {
    self.dataSource = [[TestDatasource alloc]init];
    self.dataSource.title = NSLocalizedString(@"All", @"Title for available cats list");
    self.dataSource.noContentMessage = @"No content available";
    self.dataSource.noContentTitle = @"No content";
    self.dataSource.errorMessage = @"Something went wrong";
    self.dataSource.errorTitle = @"Unable to load data";
    
    self.dataSource2 = [[AnotherTestDatasource alloc]init];
    self.dataSource2.title = NSLocalizedString(@"All", @"Title for available cats list");
    self.dataSource2.noContentMessage = @"No content available";
    self.dataSource2.noContentTitle = @"No content";
    self.dataSource2.errorMessage = @"Something went wrong";
    self.dataSource2.errorTitle = @"Unable to load data";
}

@end
