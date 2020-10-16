//
//  PaletterViewController.m
//  TouchPainter
//
//  Created by EGLS_BMAC on 2020/9/23.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//

#import "PaletterViewController.h"
#import "CommandSlider.h"
#import "SetStrokeSizeCommand.h"
#import "SetStrokeColorCommand.h"

@interface PaletterViewController ()<SetStrokeSizeCommandDelegate,SetStrokeColorCommandDelegate>

@property (weak, nonatomic) IBOutlet CommandSlider *redSlider;
@property (weak, nonatomic) IBOutlet CommandSlider *greenSlider;
@property (weak, nonatomic) IBOutlet CommandSlider *blueSlider;
@property (weak, nonatomic) IBOutlet UIView *paletteView;
@property (weak, nonatomic) IBOutlet CommandSlider *SizeSlider;

@end

@implementation PaletterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self defaultCommand];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [[NSUserDefaults standardUserDefaults] setFloat:self.redSlider.value forKey:@"red"];
    [[NSUserDefaults standardUserDefaults] setFloat:self.blueSlider.value forKey:@"blue"];
    [[NSUserDefaults standardUserDefaults] setFloat:self.greenSlider.value forKey:@"green"];
    [[NSUserDefaults standardUserDefaults] setFloat:self.SizeSlider.value forKey:@"size"];
}

#pragma mark - Target
- (IBAction)touchDown:(UIBarButtonItem *)sender {
    ((void (*)(id, SEL,id))objc_msgSend)((id)[CoordinatingController sharedInstance], @selector(requestViewChangeByObject:),self);
}

- (IBAction)onCommandSliderValueChanged:(CommandSlider *)sender {
    [[sender command] execute];
}

#pragma mark - SetStrokeSizeCommandDelegate
- (void)command:(SetStrokeColorCommand *)command didFinishColorUpdateWithColor:(UIColor *)color {
    [self.paletteView setBackgroundColor:color];
}

- (void)command:(SetStrokeColorCommand *)command didRequestColorComponentsForRed:(CGFloat *)red green:(CGFloat *)green blue:(CGFloat *)blue {
    *red = self.redSlider.value;
    *green = self.greenSlider.value;
    *blue = self.blueSlider.value;
}

#pragma mark - SetStrokeColorCommandDelegate
- (void)command:(SetStrokeSizeCommand *)command didRequestForStrokeSize:(CGFloat *)size {
    *size = self.SizeSlider.value;
}

#pragma mark - Private methods
- (void)defaultCommand {
    SetStrokeColorCommand *colorCommand = (SetStrokeColorCommand *)[self.redSlider command];
    __weak typeof(self) weakSelf = self;
    
    [colorCommand setRGBValuesProvider:^(CGFloat * _Nonnull red, CGFloat * _Nonnull green, CGFloat * _Nonnull blue) {
        *red = weakSelf.redSlider.value;
        *green = weakSelf.greenSlider.value;
        *blue = weakSelf.blueSlider.value;
    }];
    
    [colorCommand setPostColorUpdateProvider:^(UIColor * _Nonnull color) {
        weakSelf.paletteView.backgroundColor = color;
    }];
    
    self.redSlider.value = [[NSUserDefaults standardUserDefaults] floatForKey:@"red"];
    self.greenSlider.value = [[NSUserDefaults standardUserDefaults] floatForKey:@"green"];
    self.blueSlider.value = [[NSUserDefaults standardUserDefaults] floatForKey:@"blue"];
    self.SizeSlider.value = [[NSUserDefaults standardUserDefaults] floatForKey:@"size"];
    
    self.paletteView.backgroundColor = [UIColor colorWithRed:self.redSlider.value green:self.greenSlider.value blue:self.blueSlider.value alpha:1];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
