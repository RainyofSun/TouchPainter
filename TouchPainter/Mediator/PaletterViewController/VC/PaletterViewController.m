//
//  PaletterViewController.m
//  TouchPainter
//
//  Created by EGLS_BMAC on 2020/9/23.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//

#import "PaletterViewController.h"

@interface PaletterViewController ()

@end

@implementation PaletterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    ((void (*)(id, SEL,id))objc_msgSend)((id)[CoordinatingController sharedInstance], @selector(requestViewChangeByObject:),self);
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
