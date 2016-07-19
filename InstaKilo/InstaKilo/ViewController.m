//
//  ViewController.m
//  InstaKilo
//
//  Created by Martin Zhang on 2016-07-13.
//  Copyright © 2016 Martin Zhang. All rights reserved.
//

#import "ViewController.h"
#import "AMGGTSCell.h"
#import "AMGImage.h"
#import "HeaderCollectionView.h"

typedef NS_ENUM(NSInteger, CarCategory) {
    CarCategoryMake,
    CarCategoryBody
};

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UISegmentedControl *sortingSwitch;
@property (nonatomic, strong) NSArray *make;
@property (nonatomic, strong) NSArray *body;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) NSMutableArray *gTSPhotoArray;
@property (strong, nonatomic) NSMutableDictionary *makeDictionary;
@property (strong, nonatomic) NSMutableDictionary *bodyDictionary;

@end

@implementation ViewController 

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    AMGImage *c63Image = [[AMGImage alloc] initImageWithImageName:@"03-2017-mercedes-amg-c63-cabrio-ny-1" make:@"Mercedes-Benz" andBodyType:@"Coupe"];
    AMGImage *c450Image = [[AMGImage alloc]initImageWithImageName:@"05" make:@"Mercedes-Benz" andBodyType:@"Sedan"];
    AMGImage *gTImage1 = [[AMGImage alloc]initImageWithImageName:@"2015-mercedes-amg-gt-yellow-shadow copy" make:@"Mercedes-Benz" andBodyType:@"Coupe"];
    AMGImage *gTImage2 = [[AMGImage alloc]initImageWithImageName:@"2015_mercedes_amg_gt-wide copy" make:@"Mercedes-Benz" andBodyType:@"Coupe"];
    AMGImage *mImage1 = [[AMGImage alloc]initImageWithImageName:@"BUR_M_model_overview_performance_history_B2.1_A" make:@"BMW" andBodyType:@"Coupe"];
    AMGImage *m5Image = [[AMGImage alloc]initImageWithImageName:@"BUR_M_model_overview_dynamic_engineering_B2.3_A" make:@"BMW" andBodyType:@"Sedan"];
    AMGImage *gTImage3 = [[AMGImage alloc]initImageWithImageName:@"2016-Mercedes-AMG_GT_photo-024-1680 copy" make:@"Mercedes-Benz" andBodyType:@"Coupe"];
    AMGImage *mImage2 = [[AMGImage alloc]initImageWithImageName:@"BUR_M_model_overview_performance_history_B2.1_C" make:@"BMW" andBodyType:@"Coupe"];
    AMGImage *gTImage4 = [[AMGImage alloc] initImageWithImageName:@"2016-mercedes-gt-s-12-front-m copy" make:@"Mercedes-Benz" andBodyType:@"Coupe"];
    AMGImage *mImage3 = [[AMGImage alloc] initImageWithImageName:@"BUR_M_model_overview_performance_history_B2.1_D" make:@"BMW" andBodyType:@"Coupe"];

    self.bodyDictionary = [[NSMutableDictionary alloc] init];
    self.makeDictionary = [[NSMutableDictionary alloc] init];
    self.make = @[@"BMW", @"Mercedes-Benz"];
    self.body = @[@"Coupe", @"Sedan"];
    
    self.gTSPhotoArray = [@[c63Image,
                           c450Image,
                           gTImage1,
                           gTImage2,
                           gTImage3,
                           gTImage4,
                           mImage1,
                           mImage2,
                           mImage3,
                           m5Image] mutableCopy];
    
    self.view.backgroundColor = [UIColor blackColor];
    
    [self switchPressed:self.sortingSwitch];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)switchPressed:(UISegmentedControl *)sender {
    switch (sender.selectedSegmentIndex) {
        case CarCategoryMake:
            for (NSString *aMake in self.make) {
                NSMutableArray *make = [NSMutableArray array];
                for (AMGImage *pic in self.gTSPhotoArray) {
                    if ([pic.carMake isEqualToString:aMake]) {
                        [make addObject:pic];
                    }
                } 
                [self.makeDictionary setObject:make
                                        forKey:aMake];
            }
            break;
            
        case CarCategoryBody:
            for (NSString *aBody in self.body) {
                NSMutableArray *body = [NSMutableArray array];
                for (AMGImage *pic in self.gTSPhotoArray) {
                    if ([pic.carBodyType isEqualToString:aBody]) {
                        [body addObject:pic];
                    }
                }
                [self.bodyDictionary setObject:body
                                        forKey:aBody];
            }
            break;
    }
    [self.collectionView reloadData];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 2;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView
    numberOfItemsInSection:(NSInteger)section {

    switch (self.sortingSwitch.selectedSegmentIndex) {
        case CarCategoryMake: {
//            NSMutableArray *aMakeArray = [self.makeDictionary.allValues objectAtIndex:section];
            NSMutableArray *aMakeArray = self.makeDictionary.allValues[section];
            return aMakeArray.count;
        }
            break;
            
        case CarCategoryBody: {
            NSMutableArray *aBodyArray = [self.bodyDictionary.allValues objectAtIndex:section];
            return aBodyArray.count;
        }
            break;
    }
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    AMGGTSCell *aMGCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GTSCell" forIndexPath:indexPath];
    
    switch (self.sortingSwitch.selectedSegmentIndex) {
        case CarCategoryMake: {
            NSMutableArray *displayArray = [self.makeDictionary.allValues objectAtIndex:indexPath.section];
            AMGImage *carImage = [displayArray objectAtIndex: indexPath.item];
            aMGCell.aMGImageView.image = carImage.carImage;
        }
            break;
            
        case CarCategoryBody: {
            NSMutableArray *displayArray = [self.bodyDictionary.allValues objectAtIndex:indexPath.section];
            AMGImage *carImage = [displayArray objectAtIndex: indexPath.item];
            aMGCell.aMGImageView.image = carImage.carImage;
        }
            break;

    }
    
    return aMGCell;
    
}

@end
