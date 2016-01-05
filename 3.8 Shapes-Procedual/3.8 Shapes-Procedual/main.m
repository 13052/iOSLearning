//
//  main.m
//  3.8 Shapes-Procedual
//
//  Created by 丁一航 on 16/1/3.
//  Copyright © 2016年 丁一航. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum{
    kCircle,
    kRectangle,
    kEgg
}ShapeType;//define a enum type of graphics

typedef enum{
    kRedColor,
    kGreenColor,
    kBlueColor
}ShapeColor;//define a enum type of color

typedef struct{
    int x, y, width, height;
}ShapeRect;//define a struct type of data of graphics

typedef struct{
    ShapeType type;
    ShapeColor fillColor;
    ShapeRect bounds;
}Shape;//define a struct type of property of graphics

NSString *colorName (ShapeColor colorName){
    switch(colorName){
        case kRedColor: return @"red";
            break;
        case kGreenColor: return @"green";
            break;
        case kBlueColor: return @"blue";
            break;
    }
    return @"no clue";
}//function that naming colors


void drawCircle(ShapeRect bounds, ShapeColor fillColor){
    NSLog(@"drawing a circle at (%d %d %d %d) in %@",bounds.x, bounds.y, bounds.width, bounds.height, colorName(fillColor));
}//function that drawing a circle

void drawRectangle(ShapeRect bounds, ShapeColor fillColor){
    NSLog(@"drawing a rectangle at (%d %d %d %d) in %@",bounds.x, bounds.y, bounds.width, bounds.height, colorName(fillColor));
}//function that drawing a rectangle

void drawEgg(ShapeRect bounds, ShapeColor fillColor){
    NSLog(@"drawing a egg at (%d %d %d %d) in %@",bounds.x, bounds.y, bounds.width, bounds.height, colorName(fillColor));
}//function that drawing an egg

void drawShapes(Shape shapes[], int count){
    for(int i = 0; i < count; i++){
        switch(shapes[i].type){
            case kCircle: drawCircle(shapes[i].bounds, shapes[i].fillColor);
                break;
            case kRectangle: drawRectangle(shapes[i].bounds, shapes[i].fillColor);
                break;
            case kEgg: drawEgg(shapes[i].bounds, shapes[i].fillColor);
                break;
        }
    }
}//function that finish drawing

int main(int argc, const char * argv[]) {
    
    Shape shapes[3];
    
    ShapeRect rect0 = {0, 0, 10, 30};
    shapes[0].type = kCircle;
    shapes[0].fillColor = kRedColor;
    shapes[0].bounds = rect0;
    
    ShapeRect rect1 = {30, 40, 50, 60};
    shapes[1].type = kRectangle;
    shapes[1].fillColor = kGreenColor;
    shapes[1].bounds = rect1;
    
    ShapeRect rect2 = {15, 18, 37, 29};
    shapes[2].type = kEgg;
    shapes[2].fillColor = kBlueColor;
    shapes[2].bounds = rect2;
    
    drawShapes (shapes, 3);
    
    return 0;
}//main
