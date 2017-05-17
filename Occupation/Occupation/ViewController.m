//
//  ViewController.m
//  Occupation
//
//  Created by Никулин Максим on 17/05/2017.
//  Copyright © 2017 Никулин Максим. All rights reserved.
//

#import "ViewController.h"

static CGFloat const AONavigationBarHeigth = 44.0;
static CGFloat const AOStatusBarHeight = 20.0;

static NSUInteger const AOFieldSize = 18;
static CGFloat const AOFieldMargin = 10.0;
static CGFloat const AOCellSpacing = 1.0;

@implementation ViewController

#pragma mark - Live cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupView];
    [self setupCells];
}

#pragma mark - View setup

- (void)setupView {
    self.view.backgroundColor = [UIColor blackColor];
}

- (void)setupCells {
    CGFloat cellSize = (CGRectGetWidth(UIScreen.mainScreen.bounds) - AOFieldMargin * 2) / AOFieldSize - AOCellSpacing;
    
    CGFloat leftPosition = AOFieldMargin;
    CGFloat topPosition = AOFieldMargin + AOStatusBarHeight;
    
    for (NSUInteger i = 0; i < AOFieldSize; ++i) {
        leftPosition = AOFieldMargin;
        for (NSUInteger j = 0; j < AOFieldSize; ++j) {
            CGRect frame = CGRectMake(leftPosition, topPosition, cellSize, cellSize);
            UIView *cell = [[UIView alloc] initWithFrame:frame];
            cell.backgroundColor = [self generateRandomColor];
            [self.view addSubview:cell];
            leftPosition += cellSize + AOCellSpacing;
        }
        topPosition += cellSize + AOCellSpacing;
    }
}

#pragma mark - Appearance

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

#pragma mark - Utilities

- (UIColor *)generateRandomColor {
    switch (arc4random_uniform(5) % 5) {
        case 0:
            return [UIColor redColor];
        case 1:
            return [UIColor whiteColor];
        case 2:
            return [UIColor blueColor];
        case 3:
            return [UIColor greenColor];
        case 4:
            return [UIColor yellowColor];
        default:
            return [UIColor grayColor];
    }
}

@end
