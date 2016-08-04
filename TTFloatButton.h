//
//  TTFloatButton.h
//  TutorTalk-Consultant
//
//  Created by ThoamsTan on 16/8/4.
//  Copyright © 2016年 eddytsai. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^FloatButtonTaped)(void);
@interface TTFloatButton : UIWindow
+ (TTFloatButton *)sharedFloatButtonWithBlock:(FloatButtonTaped)floatButtonTaped;
@end
