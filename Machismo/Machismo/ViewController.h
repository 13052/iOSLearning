//
//  ViewController.h
//  Machismo
//
//  Created by iMac on 16/3/7.
//  Copyright © 2016年 丁一航. All rights reserved.
//
// Abstract class. Must implement methods as described below.

#import <UIKit/UIKit.h>
#import "Deck.h"
@interface ViewController : UIViewController

// protected
// fro subclasses

- (Deck *)createDeck; //abstract


@end

