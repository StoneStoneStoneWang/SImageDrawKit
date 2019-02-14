//
//  SArrowImageView.m
//  SUserKit
//
//  Created by three stone 王 on 2019/2/13.
//  Copyright © 2019年 three stone 王. All rights reserved.
//

#import "SArrowImageView.h"
#import "SToolsKit.h"

@interface SArrowImageView()

@property (nonatomic ,strong) NSMutableArray *lineColors;

@property (nonatomic ,assign) SArrowImageType arrowType;

@end

@implementation SArrowImageView

- (NSMutableArray *)lineColors {
    
    if (!_lineColors) {
        
        _lineColors = [NSMutableArray array];
    }
    return _lineColors;
}

- (void)setLineColor:(NSString *)lineColor {
    
    if (lineColor) {
        
        [self.lineColors removeAllObjects];
        
        [self.lineColors addObjectsFromArray: [UIColor s_transformByHexColorStr:lineColor]];
        
        [self setNeedsDisplay];
    }
}

+ (UIImage *)s_arrowImageWithArrowType:(SArrowImageType)arrowType andColor:(nonnull NSString *)hexColor{
    
    SArrowImageView *i = [[SArrowImageView alloc] init];
    
    i.arrowType = arrowType;
    
    [i setLineColor:hexColor];
    
    i.frame = arrowType == SArrowImageTypeNormal ? CGRectMake(0, 0, 20, 32) : arrowType == SArrowImageTypeArrow ? CGRectMake(0, 0, 15, 24) : CGRectZero;
    
    return [UIImage s_transformToImageForView:i];
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self == [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}
- (instancetype)init {
    if (self == [super init]) {
        
        self.backgroundColor = [UIColor clearColor];
        
        [self.lineColors addObjectsFromArray: @[@(0.0),@(0.0),@(0.0)]];
    }
    return self;
}

//CGRectMake(0, 0, 15, 24)
- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    switch (self.arrowType) {
        case SArrowImageTypeNormal: [self s_normal]; break;
            
        case SArrowImageTypeArrow: [self s_arrow]; break;
            
        case SArrowImageTypeNone: break;
    }
}

- (void)s_normal {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextSetLineWidth(context, 3);  //线宽
    CGContextSetAllowsAntialiasing(context, true); //抗锯齿
    
    if (self.lineColors.count) {
        //线的颜色
        CGContextSetRGBStrokeColor(context, [self.lineColors[0] doubleValue] / 255.0, [self.lineColors[1] doubleValue] / 255.0, [self.lineColors[2] doubleValue] / 255.0, 1.0);
    }
    
    CGContextMoveToPoint(context, self.frame.size.width, 0);  //起点坐标
    
    CGContextAddLineToPoint(context, 0, self.frame.size.height / 2);   //终点坐标
    
    CGContextAddLineToPoint(context, self.frame.size.width, self.frame.size.height);
    
    CGContextStrokePath(context);
}

- (void)s_arrow {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextSetLineWidth(context, 3);  //线宽
    CGContextSetAllowsAntialiasing(context, true); //抗锯齿
    
    if (self.lineColors.count) {
        //线的颜色
        CGContextSetRGBStrokeColor(context, [self.lineColors[0] doubleValue] / 255.0, [self.lineColors[1] doubleValue] / 255.0, [self.lineColors[2] doubleValue] / 255.0, 1.0);
    }
    //线的颜色
    CGContextMoveToPoint(context, 0, self.frame.size.height / 2);  //起点坐标
    
    CGContextAddLineToPoint(context, self.frame.size.height / 2 , 0);   //终点坐标
    
    CGContextMoveToPoint(context, 0, self.frame.size.height / 2);
    
    CGContextAddLineToPoint(context, self.frame.size.height / 2 , self.frame.size.height);
    
    CGContextMoveToPoint(context, 0, self.frame.size.height / 2);
    
    CGContextAddLineToPoint(context, self.frame.size.width, self.frame.size.height / 2);
    
    CGContextStrokePath(context);
}
@end
