//
//  AMGImage.h
//  InstaKilo
//
//  Created by Martin Zhang on 2016-07-13.
//  Copyright © 2016 Martin Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AMGImage : UIImage

@property NSString *carName;
@property NSString *carMake;
@property NSString *carBodyType;

- (UIImage *)initImageWithImageName:(NSString *)name make:(NSString *)make andBodyType:(NSString *)body;

@end
