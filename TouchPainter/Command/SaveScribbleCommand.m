//
//  SaveScribbleCommand.m
//  TouchPainter
//
//  Created by EGLS_BMAC on 2020/9/25.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//

#import "SaveScribbleCommand.h"
#import "ScribbleManager.h"

@implementation SaveScribbleCommand

- (void)dealloc {
    NSLog(@"DELLOC : %@",NSStringFromClass(self.class));
}

- (void)execute {
    UIImage *canvasViewImage = ((UIImage * (*)(id, SEL))objc_msgSend)((id)[CoordinatingController sharedInstance].canvasViewController, @selector(getCanvasViewImage));
    Scribble *scribble = ((Scribble * (*)(id, SEL))objc_msgSend)((id)[CoordinatingController sharedInstance].canvasViewController, @selector(getScribble));
    
    ScribbleManager *scribbleManager = [[ScribbleManager alloc] init];
    [scribbleManager saveScribble:scribble thumnail:canvasViewImage];
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"Your scrbble image is saved" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alert addAction:cancleAction];
    [alert addAction:sureAction];
    [[CoordinatingController sharedInstance].activeViewController presentViewController:alert animated:YES completion:nil];
}

@end

