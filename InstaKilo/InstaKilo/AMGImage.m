//
//  AMGImage.m
//  InstaKilo
//
//  Created by Martin Zhang on 2016-07-13.
//  Copyright © 2016 Martin Zhang. All rights reserved.
//

#import "AMGImage.h"

@implementation AMGImage

-(UIImage *)initImageWithImageName:(NSString *)name make:(NSString *)make andBodyType:(NSString *)body {
    self.carName = name;
    self.carMake = make;
    self.carBodyType = body;
    return self;
}

@end
