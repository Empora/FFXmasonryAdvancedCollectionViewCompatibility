//
//  FFXMasonryGridLayoutInfo.m
//  IntegrationOfMasonryLayout
//
//  Created by Sebastian Boldt on 10.02.15.
//  Copyright (c) 2015 Empora. All rights reserved.
//

#import "FFXMasonryGridLayoutInfo.h"
#import "FFXMasonryGridLayoutSectionInfo.h"
@implementation FFXMasonryGridLayoutInfo
-(Class)layoutSectionInfoClass{
    return [FFXMasonryGridLayoutSectionInfo class];
}
@end
