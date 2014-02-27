//
//  PlayingCardView.h
//  SuperCard
//
//  Created by Rachel Johnson on 2/25/14.
//  Copyright (c) 2014 Rachel Johnson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayingCardView : UIView

@property (nonatomic) NSUInteger *rank;
@property (nonatomic) NSString *suit;
@property (nonatomic) Boolean faceUp;


-(CGFloat)cornerScaleFactor;

-(CGFloat)cornerRadius;

-(CGFloat)cornerOffset;

-(void)setup;

-(void)drawCorners;

-(NSString *)rankAsString;

@end
