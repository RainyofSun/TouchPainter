//
//  CanvasViewController.m
//  TouchPainter
//
//  Created by EGLS_BMAC on 2020/9/23.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//

#import "CanvasViewController.h"
#import "CanvasView.h"
#import "CanvasViewGenerator.h"
#import "CommandBarButton.h"

@interface CanvasViewController ()

@property (weak, nonatomic) IBOutlet UIView *containerView;
/** canvasView */
@property (nonatomic,strong) CanvasView *canvasView;

@end

@implementation CanvasViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self loadDefaultCanvasView];
    [self setDefaultScribble];
}

#pragma mark - touch methods
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}

#pragma mark - Target
- (IBAction)touchDeleteItem:(CommandBarButton *)sender {
    [[sender command] execute];
}

- (IBAction)touchSaveItem:(CommandBarButton *)sender {
    [[sender command] execute];
}

- (IBAction)touchOpenThumbnailItem:(UIBarButtonItem *)sender {
    ((void (*)(id, SEL, UIBarButtonItem *))objc_msgSend)((id)[CoordinatingController sharedInstance], @selector(requestViewChangeByObject:), sender);
}

- (IBAction)touchPaletterItem:(UIBarButtonItem *)sender {
    ((void (*)(id, SEL, UIBarButtonItem *))objc_msgSend)((id)[CoordinatingController sharedInstance], @selector(requestViewChangeByObject:), sender);
}

- (IBAction)touchUnDoItem:(UIBarButtonItem *)sender {

}

- (IBAction)touchReDoItem:(UIBarButtonItem *)sender {

}

#pragma mark - 消息透传
- (UIImage *)getCanvasViewImage {
    return [self.canvasView image];
}

- (Scribble *)getScribble {
    return self.scribble;
}

- (void)deleteScribble {
    [self setScribble:[[Scribble alloc] init]];
}

#pragma mark - private methods
- (void)loadDefaultCanvasView {
    CanvasViewGenerator *defaultGenerator = [[CanvasViewGenerator alloc] init];
    self.canvasView = [defaultGenerator canvasViewWithFrame:CGRectMake(0, 10, CGRectGetWidth(self.view.bounds), CGRectGetHeight([UIScreen mainScreen].bounds) - 54)];
    [self.containerView addSubview:self.canvasView];
}

- (void)setDefaultScribble {
    
}

#pragma mark - set
- (void)setScribble:(Scribble *)scribble {
    _scribble = scribble;
    [scribble addObserver:self forKeyPath:@"mark" options:NSKeyValueObservingOptionInitial | NSKeyValueObservingOptionNew context:nil];
}

- (void)setStrokeSize:(CGFloat)strokeSize {
    _strokeSize = strokeSize;
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
