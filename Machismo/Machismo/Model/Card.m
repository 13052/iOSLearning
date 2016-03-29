//
//  Card.m
//  Machismo
//
//  Created by iMac on 16/3/7.
//  Copyright © 2016年 丁一航. All rights reserved.
//

#import "Card.h"

@implementation Card

- (int)match:(NSArray *)otherCards {
    int score = 0;
    
    for (Card *card in otherCards) {
        if ([card.contents isEqualToString:self.contents]) {
            score = 1;
        }
    }
    
    return score;
}

@end
