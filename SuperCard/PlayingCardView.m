//
//  PlayingCardView.m
//  SuperCard
//
//  Created by Rachel Johnson on 2/25/14.
//  Copyright (c) 2014 Rachel Johnson. All rights reserved.
//

#import "PlayingCardView.h"

@implementation PlayingCardView

double const CORNER_FONT_STANDARD_HEIGHT = 180.0;
double const CORNER_RADIUS = 12.0;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


-(void)setRank:(NSUInteger *)r{
    self.rank = r;
    [self setNeedsDisplay];
}

-(void)setSuit:(NSString *)s{
    self.suit = s;
    [self setNeedsDisplay];
}

-(void)setFaceUp:(Boolean)face{
    self.faceUp = face;
    [self setNeedsDisplay];
}

-(CGFloat)cornerScaleFactor{
    CGFloat ret = self.frame.size.width/CORNER_FONT_STANDARD_HEIGHT;
    return ret;
}

-(CGFloat)cornerRadius{
    CGFloat ret = CORNER_RADIUS * [self cornerScaleFactor];
    return ret;
}

-(CGFloat)cornerOffset{
    CGFloat ret = [self cornerRadius]*3;
    return ret;
}

-(NSString *)rankAsString{
    NSArray *arr = [NSArray arrayWithObjects:@"?", @"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8",
                    @"9", @"10", @"J", @"Q", @"K", nil];
    return arr;
}

-(void)drawRect:(CGRect)rect{
    UIBezierPath *roundedRect = [UIBezierPath bezierPathWithRoundedRect:[self bounds] cornerRadius:[self cornerRadius]];                         
    [roundedRect addClip];
    [[UIColor whiteColor]setFill];
    UIRectFill([self bounds]);
    
    [[UIColor blackColor]setStroke];
    [roundedRect stroke];
    
    [self drawCorners];
}

-(void)setup{
    [self setBackgroundColor:nil];
    [self setOpaque:NO];
    [self setContentMode:UIViewContentModeRedraw];
}

-(void)awakeFromNib{
    [self setup];
}

-(void)drawCorners{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.alignment = UITextAlignmentCenter;
    UIFont *cornerFont; //= [UIFont preferredFontForTextStyle:UIFontTextStyeBody];
    cornerFont = [cornerFont fontWithSize:cornerFont.pointSize * [self cornerScaleFactor]];
    
    NSString *cornerString = [NSString stringWithFormat:@"%@\n%@", [self rankAsString], self.suit];
    NSAttributedString *cornerText = [[NSAttributedString alloc] initWithString:cornerString attributes:@{NSFontAttributeName: cornerFont, NSParagraphStyleAttributeName:paragraphStyle}];
    CGRect textBounds;
    textBounds.size = [cornerText size];
    textBounds.origin = CGPointMake([self cornerOffset], [self cornerOffset]);
    [cornerText drawInRect:textBounds];
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(ctx,self.bounds.size.width, self.bounds.size.height);
    CGContextRotateCTM(ctx, M_PI);
    [cornerText drawInRect:textBounds];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
