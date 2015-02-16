//
//  FFXmasonryAdvancedCollectionViewCompatibilityTests.m
//  FFXmasonryAdvancedCollectionViewCompatibilityTests
//
//  Created by Sebastian Boldt on 10.02.15.
//  Copyright (c) 2015 Empora. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "FFXMasonryGridLayoutInfo.h"
#import "FFXMasonryGridLayoutSectionInfo.h"
#import "FFXMasonryGridLayout.h"
@interface FFXmasonryAdvancedCollectionViewCompatibilityTests : XCTestCase
@end

@implementation FFXmasonryAdvancedCollectionViewCompatibilityTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void)testThatlayoutInfoClassMethodReturnsCorrectClass {
    FFXMasonryGridLayout * gridLayout = [[FFXMasonryGridLayout alloc]init];
    XCTAssert([gridLayout layoutInfoClass]==[FFXMasonryGridLayoutInfo class],@"class should be FFXMasonryGridLayout");
}

-(void)testThatlayoutSectionInfoClassReturnsCorrectClass {
    FFXMasonryGridLayoutInfo * gridLayoutInfo = [[FFXMasonryGridLayoutInfo alloc]init];
    XCTAssert([gridLayoutInfo layoutSectionInfoClass]==[FFXMasonryGridLayoutSectionInfo class],@"class should be FFXMasonryGridLayout");
}

@end
