//
//  SArrowImageView.h
//  SUserKit
//
//  Created by three stone 王 on 2019/2/13.
//  Copyright © 2019年 three stone 王. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SArrowImageType.h"

NS_ASSUME_NONNULL_BEGIN

@interface SArrowImageView : UIView

+ (UIImage *)s_arrowImageWithArrowType:(SArrowImageType) arrowType andColor:(NSString *)hexColor;

@end

NS_ASSUME_NONNULL_END
