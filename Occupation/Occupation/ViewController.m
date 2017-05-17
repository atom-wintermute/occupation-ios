//
//  ViewController.m
//  Occupation
//
//  Created by Никулин Максим on 17/05/2017.
//  Copyright © 2017 Никулин Максим. All rights reserved.
//

#import "ViewController.h"

static CGFloat const AOStatusBarHeight = 20.0;

static NSUInteger const AOFieldSize = 18;
static NSUInteger const AOButtonCount = 5;
static CGFloat const AOFieldMargin = 10.0;

static CGFloat const AOCellSpacing = 1.0;

static CGFloat const AOButtonOffset = 15.0;
static CGFloat const AOButtonHeight = 44.0;
static CGFloat const AOButtonSpacing = 1.0;

@implementation ViewController

#pragma mark - Live cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupView];
    [self setupCells];
    [self setupButtons];
}

#pragma mark - View setup

- (void)setupView {
    self.view.backgroundColor = [UIColor blackColor];
}

- (void)setupCells {
    CGFloat cellSize = [self cellSize];
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

- (void)setupButtons {
    CGFloat buttonWidth = (CGRectGetWidth(UIScreen.mainScreen.bounds) - AOFieldMargin * 2) / AOButtonCount - AOButtonSpacing;
    CGFloat topPosition = AOFieldMargin + AOStatusBarHeight + AOFieldSize * ([self cellSize] + AOCellSpacing) + AOButtonOffset;
    CGFloat leftPosition = AOFieldMargin;
    
    for (NSUInteger i = 0; i < AOButtonCount; ++i) {
        CGRect frame = CGRectMake(leftPosition, topPosition, buttonWidth, AOButtonHeight);
        UIButton *button = [[UIButton alloc] initWithFrame:frame];
        button.backgroundColor = [self colorForButtonWithIndex:i];
        [self.view addSubview:button];
        
        leftPosition += buttonWidth + AOButtonSpacing;
    }
}

#pragma mark - Appearance

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

#pragma mark - Utilities

- (CGFloat)cellSize {
    return (CGRectGetWidth(UIScreen.mainScreen.bounds) - AOFieldMargin * 2) / AOFieldSize - AOCellSpacing;
}

- (UIColor *)generateRandomColor {
    switch (arc4random_uniform(AOButtonCount) % AOButtonCount) {
        case 0:
            return [UIColor yellowColor];
        case 1:
            return [UIColor redColor];
        case 2:
            return [UIColor blueColor];
        case 3:
            return [UIColor greenColor];
        case 4:
            return [UIColor whiteColor];
        default:
            return [UIColor grayColor];
    }
}

- (UIColor *)colorForButtonWithIndex:(NSUInteger)index {
    switch (index) {
        case 0:
            return [UIColor yellowColor];
        case 1:
            return [UIColor redColor];
        case 2:
            return [UIColor blueColor];
        case 3:
            return [UIColor greenColor];
        case 4:
            return [UIColor whiteColor];
        default:
            return [UIColor grayColor];
    }
}

@end
