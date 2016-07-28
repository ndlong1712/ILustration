//
//  ViewController.m
//  ILustration
//
//  Created by NguyenDinh.Long on 7/28/16.
//  Copyright © 2016 NguyenDinh.Long. All rights reserved.
//

#import "ViewController.h"
#import "ASValueTrackingSlider.h"
#import "ASValuePopUpView.h"
#import "MyIdol.h"
#import "Define.h"
#import "Uitilities.h"

@interface ViewController () <ASValueTrackingSliderDataSource>

@property (weak, nonatomic) IBOutlet UILabel *lbTitle;
@property (weak, nonatomic) IBOutlet UILabel *lbGender;
@property (weak, nonatomic) IBOutlet UILabel *lbQuestion;
@property (weak, nonatomic) IBOutlet UILabel *lbFemale;
@property (weak, nonatomic) IBOutlet UILabel *lbMale;
@property (weak, nonatomic) IBOutlet UILabel *lbSmoker;
@property (weak, nonatomic) IBOutlet UILabel *lbNonSmoker;
@property (weak, nonatomic) IBOutlet UILabel *lbAge;
@property (weak, nonatomic) IBOutlet UILabel *lbQuestionBot;

@property (weak, nonatomic) IBOutlet UIButton *btnNext;
@property (weak, nonatomic) IBOutlet UIButton *btnFemale;
@property (weak, nonatomic) IBOutlet UIButton *btnMale;
@property (weak, nonatomic) IBOutlet UIButton *btnSmoke;
@property (weak, nonatomic) IBOutlet UIButton *btnNonSmoke;

@property (weak, nonatomic) IBOutlet ASValueTrackingSlider *sliderTop;
@property (weak, nonatomic) IBOutlet ASValueTrackingSlider *sliderBot;

@property (strong, nonatomic) MyIdol *idol;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.lbTitle.font = [UIFont fontWithName:@"JennaSue" size:56];
    
    //my object
    self.idol = [[MyIdol alloc]init];
    self.idol.gender = None;
    self.idol.typeSmoker = NonSmoke;
    
    //custom slider bar
    [self setUpSliderBar:self.sliderTop];
    [self setUpSliderBar:self.sliderBot];
    self.sliderBot.dataSource = self;
    
}

/*
 * set up slider bar
 */
- (void)setUpSliderBar:(ASValueTrackingSlider*)slider{
    slider.popUpViewCornerRadius = 3.0;
    [slider setMaxFractionDigitsDisplayed:0];
    slider.popUpViewColor = [UIColor colorWithRed:80.0f/255.0f
                                                    green:100.0f/255.0f
                                                     blue:121.0f/255.0f
                                                    alpha:1.0f];
    slider.font = [UIFont fontWithName:@"GillSans-Bold" size:22];
    slider.textColor = [UIColor whiteColor];
    slider.popUpViewWidthPaddingFactor = 1.7;
    slider.maximumTrackTintColor = [UIColor clearColor];
    slider.minimumTrackTintColor = [UIColor clearColor];
}



#pragma slider data source
- (NSString *)slider:(ASValueTrackingSlider *)slider stringForValue:(float)value{
    value = roundf(value);
    return [NSString stringWithFormat:@"S$%.0FK",value];
}

#pragma button action
- (IBAction)tapButtonFemale:(id)sender {
    self.idol.gender = Female;
    [self.btnFemale setBackgroundImage:[UIImage imageNamed:@"ic_female_checked"] forState:UIControlStateNormal];
    [self.btnMale setBackgroundImage:[UIImage imageNamed:@"ic_male"] forState:UIControlStateNormal];
}
- (IBAction)tapButtonMale:(id)sender {
    self.idol.gender = Male;
    [self.btnFemale setBackgroundImage:[UIImage imageNamed:@"ic_female"] forState:UIControlStateNormal];
    [self.btnMale setBackgroundImage:[UIImage imageNamed:@"ic_male_checked"] forState:UIControlStateNormal];
}
- (IBAction)tapButtonSmoker:(id)sender {
    self.idol.typeSmoker = MuchSmoke;
    [self.btnSmoke setBackgroundImage:[UIImage imageNamed:@"ic_smoker_checked"] forState:UIControlStateNormal];
    [self.btnNonSmoke setBackgroundImage:[UIImage imageNamed:@"ic_nonsmoker"] forState:UIControlStateNormal];
}
- (IBAction)tapButtonNonSmoker:(id)sender {
    self.idol.typeSmoker = NonSmoke;
    [self.btnNonSmoke setBackgroundImage:[UIImage imageNamed:@"ic_nonsmoker_checked"] forState:UIControlStateNormal];
    [self.btnSmoke setBackgroundImage:[UIImage imageNamed:@"ic_smoker"] forState:UIControlStateNormal];
}

- (IBAction)actionNext:(id)sender {
    self.idol.age = self.sliderTop.value;
    self.idol.covered = self.sliderBot.value;
    NSString *gender;
    NSString *typeSmoke;
    if (self.idol.gender == Female) {
        gender = DefFemale;
    }else{
        gender = DefMale;
    }
    if (self.idol.typeSmoker == MuchSmoke) {
        typeSmoke = DefSmoker;
    }else{
        typeSmoke = DefNonSmoker;
    }
    
    [Uitilities showDialogWitTitle:TitlePopup message:[NSString stringWithFormat:@"%@: %@ \n %@: %d \n %@: %@ \n %@: %d",Gender,gender,Age,self.idol.age,TypeSmoke,typeSmoke,Covered,self.idol.covered] view:self];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
