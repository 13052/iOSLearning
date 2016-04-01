//
//  PlayingCardView.h
//  SuperCard
//
//  Created by iMac on 16/3/31.
//  Copyright © 2016年 YihangDing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayingCardView : UIView

@property (nonatomic) NSUInteger rank;
@property (strong, nonatomic) NSString *suit;
@property (nonatomic) BOOL faceUp;

- (void)pinch: (UIPinchGestureRecognizer *)gesture;

@end
