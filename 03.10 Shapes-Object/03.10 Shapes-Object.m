#import <Foundation/Foundation.h>

// --------------------------------------------------
// constants for the different kinds of shapes and their colors
//如果一个变量只有几种可能的值，那么，可以把它定义为枚举类型（也称为枚举）

typedef enum {
	kRedColor,
	kGreenColor,
	kBlueColor
} ShapeColor;


// --------------------------------------------------
// Shape bounding rectangle


typedef struct {
	int x, y, width, height;
} ShapeRect;


// --------------------------------------------------
// convert from the ShapeColor enum value to a human-readable name

NSString *colorName (ShapeColor color)
{
	switch (color) {
		case kRedColor:
			return @"red";
			break;
		case kGreenColor:
			return @"green";
			break;
		case kBlueColor:
			return @"blue";
			break;
	}
	
	return @"no clue";
	
} // colorName

// --------------------------------------------------
// All about Triangles

@interface Triangle : NSObject
{
    ShapeColor fillColor;
    ShapeRect bounds;
}

- (void) setFillColor: (ShapeColor) fillColor;

- (void) setBounds: (ShapeRect) bounds;

- (void) draw;
// --------------------------------------------------
@end // Triangle

@implementation Triangle

- (void) setFillColor: (ShapeColor) c
{
    fillColor = c;
} // set FillColor

- (void) setBounds:(ShapeRect) b
{
    bounds = b;
} // setBounds

- (void) draw
{
    NSLog(@"drawing a Triangle at (%d %d %d %d) in %@", bounds.x, bounds.y, bounds.width, bounds.height, colorName(fillColor));
} // draw

@end

// --------------------------------------------------
// All about Circles

@interface Circle : NSObject// = class Circle()     @interface 用于定义类的公共接口
{
  ShapeColor  fillColor;//shapecolor 类型的变量 fillcolor
  ShapeRect   bounds;//shaperect 类型的变量 bounds
}

- (void) setFillColor: (ShapeColor) fillColor;// = void setFillColor(ShapeColor fillColor)

- (void) setBounds: (ShapeRect) bounds;// = void setBounds(ShapeRect bounds)

- (void) draw;// = void draw()
//--------------------------------------
//以上为类的声明和类方法的声明
@end // Circle

//----------------------------------------------------'
//Declaration of class 'Circle'


@implementation Circle // 用于类实现，@implementation 是一个编译器指令，表明将为某个类提供代码，类名出现在该语句之后，此处就是 Circle
//以下为声明过的各个方法的定义，不必按声明中的顺序出现，甚至可以定义没有声明过的方法（私有方法）

- (void) setFillColor: (ShapeColor) c // = void setFillColor(ShapeColor c)。此处和声明部分不相同，参数名称变了（c）这是必须的。
{
	fillColor = c;//此处注意！// = self->fillcolor = c
} // setFillColor


- (void) setBounds: (ShapeRect) b // = void setBounds(ShapeRect b)
{
	bounds = b;
} // setBounds


- (void) draw // = void draw()
{
	NSLog (@"drawing a circle at (%d %d %d %d) in %@",
		   bounds.x, bounds.y, 
           bounds.width, bounds.height,
		   colorName(fillColor));
} // draw

@end // Circle




// --------------------------------------------------
// All about Rectangles

@interface Rectangle : NSObject
{
	ShapeColor	fillColor;
	ShapeRect	bounds;
}

- (void) setFillColor: (ShapeColor) fillColor;

- (void) setBounds: (ShapeRect) bounds;

- (void) draw;

@end // Rectangle


@implementation Rectangle

- (void) setFillColor: (ShapeColor) c
{
	fillColor = c;
} // setFillColor


- (void) setBounds: (ShapeRect) b
{
	bounds = b;
} // setBounds


- (void) draw
{
	NSLog (@"drawing a rectangle at (%d %d %d %d) in %@",
		   bounds.x, bounds.y, 
		   bounds.width, bounds.height,
		   colorName(fillColor));
} // draw

@end // Rectangle


// --------------------------------------------------
// All about OblateSphereoids

@interface OblateSphereoid : NSObject
{
	ShapeColor	fillColor;
	ShapeRect	bounds;
}

- (void) setFillColor: (ShapeColor) fillColor;

- (void) setBounds: (ShapeRect) bounds;

- (void) draw;

@end // OblateSphereoid


@implementation OblateSphereoid

- (void) setFillColor: (ShapeColor) c
{
	fillColor = c;
} // setFillColor


- (void) setBounds: (ShapeRect) b
{
	bounds = b;
} // setBounds


- (void) draw
{
	NSLog (@"drawing an egg at (%d %d %d %d) in %@",
		   bounds.x, bounds.y, 
		   bounds.width, bounds.height,
		   colorName(fillColor));
} // draw

@end // OblateSphereoid



// --------------------------------------------------
// Draw the shapes

void drawShapes (id shapes[], int count)
{
	int i;
	
	for (i = 0; i < count; i++) {
		id shape = shapes[i];
		[shape draw];
	}
	
} // drawShapes



// --------------------------------------------------
// The main function.  Make the shapes and draw them

int main (int argc, const char * argv[]) 
{
	id shapes[4];
	
	ShapeRect rect0 = { 0, 0, 10, 30 };
	shapes[0] = [Circle new];
	[shapes[0] setBounds: rect0];
	[shapes[0] setFillColor: kRedColor];
	
	ShapeRect rect1 = { 30, 40, 50, 60 };
	shapes[1] = [Rectangle new];
	[shapes[1] setBounds: rect1];
	[shapes[1] setFillColor: kGreenColor];
	
	ShapeRect rect2 = { 15, 19, 37, 29 };
	shapes[2] = [OblateSphereoid new];
	[shapes[2] setBounds: rect2];
	[shapes[2] setFillColor: kBlueColor];
    
    ShapeRect rect3 = {47, 32, 80, 50};
    shapes[3] = [Triangle new];
    [shapes[3] setBounds: rect3];
    [shapes[3] setFillColor:kRedColor];
	
	drawShapes (shapes, 4);
    
	return (0);
	
} // main

