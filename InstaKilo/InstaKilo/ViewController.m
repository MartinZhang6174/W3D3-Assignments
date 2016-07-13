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

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) NSMutableArray *gTSPhotoArray;

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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.gTSPhotoArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    AMGGTSCell *aMGCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GTSCell" forIndexPath:indexPath];
//    AMGImage *carsImage = [AMGImage imageNamed:carsImage.carName];
    
    AMGImage *carImage = self.gTSPhotoArray[indexPath.row];
    UIImage *displayImage = [UIImage imageNamed:carImage.carName];
    aMGCell.aMGImageView.image = displayImage;
    
    return aMGCell;
}

@end
