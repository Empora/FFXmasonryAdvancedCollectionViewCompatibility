//
//  ViewController.h
//  FFXmasonryAdvancedCollectionViewCompatibility
//
//  Created by Sebastian Boldt on 10.02.15.
//  Copyright (c) 2015 Empora. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AAPLCollectionViewController.h>
#import "AnotherTestDatasource.h"
#import <AAPLComposedDataSource.h>
#import "TestDatasource.h"
@interface ViewController : AAPLCollectionViewController
@property (nonatomic, strong) TestDatasource * dataSource;
@property (nonatomic, strong) AnotherTestDatasource * dataSource2;
@property (nonatomic,strong) AAPLComposedDataSource * composedDatasource;
@end

