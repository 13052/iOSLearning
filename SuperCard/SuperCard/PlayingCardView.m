//
//  PlayingCardView.m
//  SuperCard
//
//  Created by iMac on 16/3/31.
//  Copyright © 2016年 YihangDing. All rights reserved.
//

#import "PlayingCardView.h"
@interface PlayingCardView()// .m file declaration
@property (nonatomic) CGFloat faceCardScaleFactor;// face of card strech scale factor, to be calculated
@end


@implementation PlayingCardView

#pragma mark - Praperties

@synthesize faceCardScaleFactor = _faceCardScaleFactor;// if you wnat to rewrite setter and getter, you should use @synthesize

#define DEFAULT_FACE_CARD_SCALE_FACTOR 0.90// default scale factor

// face card scale factor felxcible useage
- (CGFloat)faceCardScaleFactor {
    if (!_faceCardScaleFactor) _faceCardScaleFactor = DEFAULT_FACE_CARD_SCALE_FACTOR;
    return _faceCardScaleFactor;
}
- (void)setFaceCardScaleFactor:(CGFloat)faceCardScaleFactor {
    _faceCardScaleFactor = faceCardScaleFactor;
    [self setNeedsDisplay];// Marks the receiver’s entire bounds rectangle as needing to be redrawn.
}

//set suit of card
- (void)setSuit:(NSString *)suit {
    _suit = suit;
    [self setNeedsDisplay];// need to redraw
}

// set rank
- (void)setRank:(NSUInteger)rank {
    _rank = rank;
    [self setNeedsDisplay];
}

// set face up factor
- (void)setFaceUp:(BOOL)faceUp {
    _faceUp = faceUp;
    [self setNeedsDisplay];
}

// making ranks
- (NSString *)rankAsString {
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"][self.rank];// initialize rank
}

#pragma mark - Gesture Handling
- (void)pinch: (UIPinchGestureRecognizer *)gesture {// define the pinching scale
    if ((gesture.state == UIGestureRecognizerStateChanged) || (gesture.state == UIGestureRecognizerStateEnded)) {
        self.faceCardScaleFactor *= gesture.scale;
        gesture.scale = 1.0;// reset scale of gesture
    }
}

#pragma mark - Drawing
#define CORNER_FONT_STANDARD_HEIGHT 180.0// standard height of card, it might be changed
#define CORNER_RADIUS 12.0// corner radius

- (CGFloat)cornerScaleFactor { return self.bounds.size.height / CORNER_FONT_STANDARD_HEIGHT; }// corner scale setting
- (CGFloat)cornerRadius { return CORNER_RADIUS * [self cornerScaleFactor]; }// corner radius stting
- (CGFloat)cornerOffset { return [self cornerRadius] / 3.0; }// offset corner

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {// drawing rectange
    // Drawing code
    UIBezierPath *roundedRect = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:[self cornerRadius]];// drawing the rounded corner
    
    [roundedRect addClip];// can't drawing out of this view
    [[UIColor whiteColor] setFill];// fill color
    UIRectFill(self.bounds);// set the bounds of color filling
    
    [[UIColor blackColor] setStroke];
    [roundedRect stroke];
    
    if (self.faceUp){
        UIImage *faceImage = [UIImage imageNamed:[NSString stringWithFormat:@"%@%@", [self rankAsString],self.suit]];// set the image of face
        if (faceImage) {
            CGRect imageRect = CGRectInset(self.bounds,
                                           self.bounds.size.width * (1.0-self.faceCardScaleFactor),
                                           self.bounds.size.height * (1.0-self.faceCardScaleFactor));// initialize the image data
            [faceImage drawInRect:imageRect];// use initialzed data to draw image rectangle
        } else {
            [self drawPips];// draw pips with method drawPips, 'cause there is no image
        }
        
        
        [self drawCorners];// draw the rounded corner
    } else {
        [[UIImage imageNamed:@"cardback"] drawInRect:self.bounds];// show the back of card
    }
}



// make the suit and rank upside down to show a regular card looking
- (void)pushContextAndRotateUpsideDown
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, self.bounds.size.width, self.bounds.size.height);
    CGContextRotateCTM(context, M_PI);
}

- (void)popContext
{
    CGContextRestoreGState(UIGraphicsGetCurrentContext());
}

#pragma mark - Corners
-(void)drawCorners {
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.alignment = NSTextAlignmentCenter;// Make the text centerd
    
    UIFont *cornerFont = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];// Font setting
    cornerFont = [cornerFont fontWithSize:cornerFont.pointSize * [self cornerScaleFactor]];// font size
    
    NSAttributedString *cornerText = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@\n%@", [self rankAsString], self.suit] attributes:@{NSFontAttributeName: cornerFont, NSParagraphStyleAttributeName: paragraphStyle}];// corner text
    
    CGRect textBounds;// declare text bounds
    textBounds.origin = CGPointMake([self cornerOffset], [self cornerOffset]);
    textBounds.size = [cornerText size];
    [cornerText drawInRect:textBounds];

    
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGContextTranslateCTM(context, self.bounds.size.width, self.bounds.size.height);// CTM is transformation matrix
//    CGContextRotateCTM(context, M_PI);
    // not understand
    [self pushContextAndRotateUpsideDown];
    [cornerText drawInRect:textBounds];// two of this
    [self popContext];
}

#pragma mark - Pips

#define PIP_HOFFSET_PERCENTAGE 0.165
#define PIP_VOFFSET1_PERCENTAGE 0.090
#define PIP_VOFFSET2_PERCENTAGE 0.175
#define PIP_VOFFSET3_PERCENTAGE 0.270

- (void)drawPips// draw the pips in cards, let'em look like regular card
{
    if ((self.rank == 1) || (self.rank == 5) || (self.rank == 9) || (self.rank == 3)) {
        [self drawPipsWithHorizontalOffset:0
                            verticalOffset:0
                        mirroredVertically:NO];
    }
    if ((self.rank == 6) || (self.rank == 7) || (self.rank == 8)) {
        [self drawPipsWithHorizontalOffset:PIP_HOFFSET_PERCENTAGE
                            verticalOffset:0
                        mirroredVertically:NO];
    }
    if ((self.rank == 2) || (self.rank == 3) || (self.rank == 7) || (self.rank == 8) || (self.rank == 10)) {
        [self drawPipsWithHorizontalOffset:0
                            verticalOffset:PIP_VOFFSET2_PERCENTAGE
                        mirroredVertically:(self.rank != 7)];
    }
    if ((self.rank == 4) || (self.rank == 5) || (self.rank == 6) || (self.rank == 7) || (self.rank == 8) || (self.rank == 9) || (self.rank == 10)) {
        [self drawPipsWithHorizontalOffset:PIP_HOFFSET_PERCENTAGE
                            verticalOffset:PIP_VOFFSET3_PERCENTAGE
                        mirroredVertically:YES];
    }
    if ((self.rank == 9) || (self.rank == 10)) {
        [self drawPipsWithHorizontalOffset:PIP_HOFFSET_PERCENTAGE
                            verticalOffset:PIP_VOFFSET1_PERCENTAGE
                        mirroredVertically:YES];
    }
}

#define PIP_FONT_SCALE_FACTOR 0.012
// set the pips view
- (void)drawPipsWithHorizontalOffset:(CGFloat)hoffset
                      verticalOffset:(CGFloat)voffset
                          upsideDown:(BOOL)upsideDown
{
    if (upsideDown) [self pushContextAndRotateUpsideDown];
    CGPoint middle = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
    UIFont *pipFont = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    pipFont = [pipFont fontWithSize:[pipFont pointSize] * self.bounds.size.width * PIP_FONT_SCALE_FACTOR];
    NSAttributedString *attributedSuit = [[NSAttributedString alloc] initWithString:self.suit attributes:@{ NSFontAttributeName : pipFont }];
    CGSize pipSize = [attributedSuit size];
    CGPoint pipOrigin = CGPointMake(
                                    middle.x-pipSize.width/2.0-hoffset*self.bounds.size.width,
                                    middle.y-pipSize.height/2.0-voffset*self.bounds.size.height
                                    );
    [attributedSuit drawAtPoint:pipOrigin];
    if (hoffset) {
        pipOrigin.x += hoffset*2.0*self.bounds.size.width;
        [attributedSuit drawAtPoint:pipOrigin];
    }
    if (upsideDown) [self popContext];
}

- (void)drawPipsWithHorizontalOffset:(CGFloat)hoffset
                      verticalOffset:(CGFloat)voffset
                  mirroredVertically:(BOOL)mirroredVertically
{
    [self drawPipsWithHorizontalOffset:hoffset
                        verticalOffset:voffset
                            upsideDown:NO];
    if (mirroredVertically) {
        [self drawPipsWithHorizontalOffset:hoffset
                            verticalOffset:voffset
                                upsideDown:YES];
    }
}

#pragma mark - Initialization

- (void)setup// setup card view
{
    self.backgroundColor = nil;
    self.opaque = NO;
    self.contentMode = UIViewContentModeRedraw;
}

- (void)awakeFromNib// start setup
{
    [self setup];
}

- (id)initWithFrame:(CGRect)frame// initialize the frame
{
    self = [super initWithFrame:frame];
    [self setup];
    return self;
}


@end


