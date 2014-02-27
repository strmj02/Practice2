//
//  SuperCardViewController.m
//  SuperCard
//
//  Created by Rachel Johnson on 2/25/14.
//  Copyright (c) 2014 Rachel Johnson. All rights reserved.
//

#import "SuperCardViewController.h"

@interface SuperCardViewController ()

@end

@implementation SuperCardViewController

@synthesize cardView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    cardView.suit = @"♥";
    cardView.rank = 13;
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setCardView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
