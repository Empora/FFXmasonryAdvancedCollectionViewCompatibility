//
//  FFXMasonryGridLayoutSectionInfo.m
//  IntegrationOfMasonryLayout
//
//  Created by Sebastian Boldt on 10.02.15.
//  Copyright (c) 2015 Empora. All rights reserved.
//

#import "FFXMasonryGridLayoutSectionInfo.h"
#import <FFXCollectionViewMasonryLayoutLogic.h>
@interface FFXMasonryGridLayoutSectionInfo()
@property (nonatomic, strong) NSMutableArray        *lastYValueForColumns;
@end

@implementation FFXMasonryGridLayoutSectionInfo
/// Layout all the items in this section and return the total height of the section
- (void)computeLayoutWithOrigin:(CGFloat)start measureItemBlock:(AAPLLayoutMeasureBlock)measureItemBlock measureSupplementaryItemBlock:(AAPLLayoutMeasureBlock)measureSupplementaryItemBlock
{
    self.interItemSpacing = 2;
    CGFloat width = self.layoutInfo.width;
    
    /// The height available to placeholder
    CGFloat availableHeight = self.layoutInfo.height - start;
    NSInteger numberOfItems = [self.items count];
    
    __block CGFloat originY = start;
    
    // First lay out headers
    [self.headers enumerateObjectsUsingBlock:^(AAPLGridLayoutSupplementalItemInfo *headerInfo, NSUInteger headerIndex, BOOL *stop) {
        // skip headers if there are no items and the header isn't a global header
        if (!numberOfItems && !headerInfo.visibleWhileShowingPlaceholder)
            return;
        
        // skip headers that are hidden
        if (headerInfo.hidden)
            return;
        
        // This header needs to be measured!
        if (!headerInfo.height && measureSupplementaryItemBlock) {
            headerInfo.frame = CGRectMake(0, originY, width, UILayoutFittingExpandedSize.height);
            headerInfo.height = measureSupplementaryItemBlock(headerIndex, headerInfo.frame).height;
        }
        
        headerInfo.frame = CGRectMake(0, originY, width, headerInfo.height);
        originY += headerInfo.height;
    }];
    
    AAPLGridLayoutSupplementalItemInfo *placeholder = self.placeholder;
    if (placeholder) {
        // Height of the placeholder is equal to the height of the collection view minus the height of the headers
        CGFloat height = availableHeight - (originY - start);
        placeholder.height = height;
        placeholder.frame = CGRectMake(0, originY, width, height);
        originY += height;
    }
    
    // Next lay out all the items in rows
    [self.rows removeAllObjects];
    
    NSAssert(!placeholder || !numberOfItems, @"Can't have both a placeholder and items");
    
    // Lay out items and footers only if there actually ARE items.
    if (numberOfItems) {
        /**********************************/
        FFXCollectionViewMasonryLayoutLogic *layoutLogic = [[FFXCollectionViewMasonryLayoutLogic alloc]init];
        layoutLogic.numberOfColums = 2;
        layoutLogic.interItemSpacing = self.interItemSpacing;
        layoutLogic.padding = self.insets;
        layoutLogic.numberOfItems = numberOfItems;
        layoutLogic.collectionViewFrame = CGRectMake(0,0,self.layoutInfo.width, 0); // we just need height
        layoutLogic.interItemSpacing = self.interItemSpacing;
        if(!self.lastYValueForColumns) {
            [self prepareLastYValueArrayForNumberOfColumns:layoutLogic.numberOfColums];
        }
        layoutLogic.lastYValueForColumns = self.lastYValueForColumns;
        
        NSDictionary * layoutAttributes = [layoutLogic computeLayoutWithmeasureItemBlock:^CGSize(NSInteger itemIndex,CGRect frame){
            CGSize itemSize = measureItemBlock(itemIndex,CGRectZero);
            return itemSize;
        }];

        // Convert all layoutAttributes to
        NSInteger index = 0;
        AAPLGridLayoutRowInfo *row = [self addRow];

        for (AAPLGridLayoutItemInfo * item in self.items) {
            [row.items addObject:item];
            NSIndexPath * path = [NSIndexPath indexPathForItem:index inSection:0];
            UICollectionViewLayoutAttributes * attributes = layoutAttributes[path];
            item.frame = attributes.frame;
            index++;
        }
        // keep row height up to date
        CGRect rowFrame = row.frame;
        row.frame = rowFrame;
        originY += [self highestValueOfAllLastColumns];
        /*********************************************/
    }
    
    // lay out all footers
    for (AAPLGridLayoutSupplementalItemInfo *footerInfo in self.footers) {
        // skip hidden footers
        if (footerInfo.hidden)
            continue;
        // When showing the placeholder, we don't show footers
        CGFloat height = footerInfo.height;
        footerInfo.frame = CGRectMake(0, originY, width, height);
        originY += height;
    }
    self.frame = CGRectMake(0, start, width, originY - start);
}

// creates an Array with same dimensions as number of columns and initalizes its values with 0 (start point)
-(void)prepareLastYValueArrayForNumberOfColumns:(NSInteger)numberOfColums {
    NSMutableArray *array = [[NSMutableArray alloc]init];
    for (int i = 0; i< numberOfColums; i++) {
        [array addObject:@(0)];
    }
    self.lastYValueForColumns =  array;
}

-(CGFloat)highestValueOfAllLastColumns{
    return [[self.lastYValueForColumns valueForKeyPath:@"@max.intValue"] floatValue];
}
@end