//
//  AOCellModel.h
//  Occupation
//
//  Created by Никулин Максим on 17/05/2017.
//  Copyright © 2017 Никулин Максим. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, AOCellOwner) {
    AOCellOwnerPlayer = 0,
    AOCellOwnerOpponent = 1,
    AOCellOwnerNeutral = 2
};

@interface AOCellModel : NSObject

@property (nonatomic) NSUInteger colorTag;
@property (nonatomic) AOCellOwner cellOwner;

@end
