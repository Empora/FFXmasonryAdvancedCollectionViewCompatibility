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
#import "TestDatasource.h" 
#import "ViewController.h"
@interface FFXmasonryAdvancedCollectionViewCompatibilityTests : XCTestCase
@property (nonatomic,strong) UIStoryboard * storyBoard;
@end

@implementation FFXmasonryAdvancedCollectionViewCompatibilityTests

- (void)setUp {
    [super setUp];
    self.storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];

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
-(void)testFFXMasonryGridLayout {
    ViewController * controller = [self.storyBoard instantiateInitialViewController];
}
@end
