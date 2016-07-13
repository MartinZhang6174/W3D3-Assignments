//
//  AMGImage.m
//  InstaKilo
//
//  Created by Martin Zhang on 2016-07-13.
//  Copyright © 2016 Martin Zhang. All rights reserved.
//

#import "AMGImage.h"

@implementation AMGImage

-(instancetype)initImageWithImageName:(NSString *)name make:(NSString *)make andBodyType:(NSString *)body {
    if (self = [super init]) {
        self.carName = name;
        self.carMake = make;
        self.carBodyType = body;
        self.carImage = [UIImage imageNamed:name];
    }
    return self;
}



@end
