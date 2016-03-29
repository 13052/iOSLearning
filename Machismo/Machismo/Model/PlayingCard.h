//
//  PlayingCard.h
//  Machismo
//
//  Created by iMac on 16/3/8.
//  Copyright © 2016年 丁一航. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;

@end
