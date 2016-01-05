//
//  main.m
//  2.2-BOOL Party
//
//  Created by 丁一航 on 16/1/3.
//  Copyright © 2016年 丁一航. All rights reserved.
//

#import <Foundation/Foundation.h>


    //Return NO if the two integers have the same value, YES otherwise
    
    BOOL areIntsDifferent(int thing1, int thing2){
        if (thing1 == thing2){
            return (NO);
        } else{
            return (YES);
        }
    }//areIntDifferent
    //given a NO value, return the human-readable
    //strin "NO". Otherwise return "YES"
    
    NSString *boolString(BOOL yesNo){
        if (yesNo == NO){
            return (@"NO");
        } else{
            return (@"YES");
        }
    }// boolString
    
    int main(int argc, const char *argv[]){
        BOOL areTheyDifferent;
        areTheyDifferent = areIntsDifferent (5, 5);
        NSLog(@"are %d and %d different? %@", 5, 5, boolString(areTheyDifferent));
        
        areTheyDifferent = areIntsDifferent (23, 42);
        NSLog(@"are %d and %d different? %@", 23, 42, boolString(areTheyDifferent));
        
        return 0;
    }

