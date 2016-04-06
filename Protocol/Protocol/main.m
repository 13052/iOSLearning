//
//  main.m
//  Protocol
//
//  Created by iMac on 16/4/3.
//  Copyright © 2016年 YihangDing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Button.h"
#import "ButtonListener.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // initialize a button
        Button *button = [[Button alloc] init];
        
        // initialize a listener of button
        ButtonListener *listener = [[ButtonListener alloc] init];
        
        // set the listener of button
        button.delegate = listener;//put the delegate to this delegater
        
        // click button
        [button click];
        
    }
    return 0;
}
