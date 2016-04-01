//
//  PlayingCardView.h
//  SuperCard
//
//  Created by iMac on 16/3/31.
//  Copyright © 2016年 YihangDing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayingCardView : UIView

@property (nonatomic) NSUInteger rank;// rank of card
@property (strong, nonatomic) NSString *suit;//花色
@property (nonatomic) BOOL faceUp;// see if it's face up

- (void)pinch: (UIPinchGestureRecognizer *)gesture;// pinching gesture

@end
