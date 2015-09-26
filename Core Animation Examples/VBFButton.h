//
//  VBFButton.h
//  Core Animation Examples
//
//  Created by Mitchell Porter on 9/25/15.
//  Copyright © 2015 Mitchell Porter. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VBFButton : UIView

@property (nonatomic, strong) UIColor *internalColor;
@property (nonatomic, strong) UIColor *externalColor;
@property (nonatomic, strong) UIBezierPath *internalCircle;
@property (nonatomic, strong) UIBezierPath *externalCircle;

// Designated Initializer
- (id)initWithFrame:(CGRect)frame internalColor:(UIColor *)internalColor externalColor:(UIColor *)externalColor;

@end
