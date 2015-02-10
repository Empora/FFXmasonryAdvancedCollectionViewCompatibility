//
//  TestDatasource.m
//  IntegrationOfMasonryLayout
//
//  Created by Sebastian Boldt on 10.02.15.
//  Copyright (c) 2015 Empora. All rights reserved.
//

#import "TestDatasource.h"
@interface TestDatasource()
@property (nonatomic,strong)NSMutableArray * testModel;
@end
@implementation TestDatasource

-(void)loadContent {
    [self setupTestModel:YES];
}

// Creates some Testdata A stands for
-(void)setupTestModel:(BOOL)test {
    self.testModel = [[NSMutableArray alloc]init];
    //Create some TestData
    if (test) {
        for (int i = 0 ; i <100; i++) {
            int r = arc4random() % 3; // 5 different Kinds of Elements
            if (r == 1) {
                [self.testModel addObject:@"A"]; // A is Fullspan
            } else [self.testModel addObject:@"B"]; // B is Random element
        }
    } else {
        [self.testModel addObject:@"A"];
        [self.testModel addObject:@"B"];
        [self.testModel addObject:@"A"];
    }
    
    self.items = self.testModel;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    cell.backgroundColor = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
    UILabel * label = (UILabel*)[cell viewWithTag:1];
    label.text = [NSString stringWithFormat:@"%li",(long)indexPath.row];
    return  cell;
}

// Return size for each item
-(CGSize)collectionView:(UICollectionView *)collectionView sizeFittingSize:(CGSize)size forItemAtIndexPath:(NSIndexPath *)indexPath{
    NSString * string = [self.testModel objectAtIndex:indexPath.row];
    if ([string isEqualToString:@"A"]) { // fullspan
        CGSize temp = CGSizeMake(collectionView.frame.size.width, 200 + (arc4random() % 10));
        return temp;
    } else {
        // Random string
        CGSize temp = CGSizeMake(collectionView.frame.size.width/2, 100 + (arc4random() % 300));
        return temp;
    }
}
@end
