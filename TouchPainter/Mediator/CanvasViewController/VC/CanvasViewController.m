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
#import "Stroke.h"
#import "Vertex.h"
#import "Dot.h"

@interface CanvasViewController ()

@property (weak, nonatomic) IBOutlet UIView *containerView;
/** canvasView */
@property (nonatomic,strong) CanvasView *canvasView;
/** startPoint */
@property (nonatomic,assign) CGPoint startPoint;

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
    self.startPoint = [[touches anyObject] locationInView:self.canvasView];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CGPoint lastPoint = [[touches anyObject] previousLocationInView:self.canvasView];
    if (CGPointEqualToPoint(lastPoint, self.startPoint)) {
        id <Mark> newStroke = [[Stroke alloc] init];
        [newStroke setColor:self.strokeColor];
        [newStroke setSize:self.strokeSize];
        
        NSInvocation *drawInvocation = [self drawScribbleInvocation];
        [drawInvocation setArgument:&newStroke atIndex:2];
        
        NSInvocation *unDrawInvocation = [self undrawScribbleInvocation];
        [unDrawInvocation setArgument:&newStroke atIndex:2];
        [self executeInvocation:drawInvocation withUndoInvocation:unDrawInvocation];
    }
    
    CGPoint thisPoint = [[touches anyObject] locationInView:self.canvasView];
    Vertex *vertex = [[Vertex alloc] initWithLocation:thisPoint];
    [self.scribble addMark:vertex shouldAddToPreviousMark:YES];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CGPoint lastPoint = [[touches anyObject] previousLocationInView:self.canvasView];
    CGPoint thisPoint = [[touches anyObject] locationInView:self.canvasView];
    
    if (CGPointEqualToPoint(lastPoint, thisPoint)) {
        Dot *singleDot = [[Dot alloc] initWithLocation:thisPoint];
        [singleDot setColor:self.strokeColor];
        [singleDot setSize:self.strokeSize];
        
        NSInvocation *drawInvocation = [self drawScribbleInvocation];
        [drawInvocation setArgument:&singleDot atIndex:2];
        
        NSInvocation *unDrawinvocation = [self undrawScribbleInvocation];
        [unDrawinvocation setArgument:&singleDot atIndex:2];
        
        [self executeInvocation:drawInvocation withUndoInvocation:unDrawinvocation];
    }
    
    self.startPoint = CGPointZero;
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.startPoint = CGPointZero;
}

#pragma mark - KVO
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([object isKindOfClass:[Scribble class]] && [keyPath isEqualToString:@"mark"]) {
        id <Mark> mark = [change objectForKey:NSKeyValueChangeNewKey];
        [self.canvasView setMark:mark];
        [self.canvasView setNeedsDisplay];
    }
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
    [self.undoManager undo];
}

- (IBAction)touchReDoItem:(UIBarButtonItem *)sender {
    [self.undoManager redo];
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

#pragma mark - public methods
- (void)loadCanvasViewWithGenerator:(CanvasViewGenerator *)generator {
    if (_canvasView) {
        [_canvasView removeFromSuperview];
    }
    CGRect aFrame = CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds));
    CanvasView *aCanvasView = [generator canvasViewWithFrame:aFrame];
    [self setCanvasView:aCanvasView];
    [self.containerView addSubview:self.canvasView];
}

#pragma mark - private methods
- (void)loadDefaultCanvasView {
    CanvasViewGenerator *defaultGenerator = [[CanvasViewGenerator alloc] init];
    self.canvasView = [defaultGenerator canvasViewWithFrame:CGRectMake(0, 10, CGRectGetWidth(self.view.bounds), CGRectGetHeight([UIScreen mainScreen].bounds) - 54)];
    [self.containerView addSubview:self.canvasView];
}

- (void)setDefaultScribble {
    Scribble *scribble = [[Scribble alloc] init];
    [self setScribble:scribble];
    
    CGFloat redValue = [[NSUserDefaults standardUserDefaults] floatForKey:@"red"];
    CGFloat greenValuue = [[NSUserDefaults standardUserDefaults] floatForKey:@"green"];
    CGFloat blueValue = [[NSUserDefaults standardUserDefaults] floatForKey:@"blue"];
    CGFloat sizeValue = [[NSUserDefaults standardUserDefaults] floatForKey:@"size"];
    
    [self setStrokeSize:sizeValue];
    [self setStrokeColor:[UIColor colorWithRed:redValue green:greenValuue blue:blueValue alpha:1]];
}

#pragma mark - Draw methods
- (NSInvocation *)drawScribbleInvocation {
    NSMethodSignature *executeMethodSignature = [self.scribble methodSignatureForSelector:@selector(addMark:shouldAddToPreviousMark:)];
    NSInvocation *drawInvocation = [NSInvocation invocationWithMethodSignature:executeMethodSignature];
    [drawInvocation setTarget:self.scribble];
    [drawInvocation setSelector:@selector(addMark:shouldAddToPreviousMark:)];
    BOOL attachToPreviousMaek = NO;
    [drawInvocation setArgument:&attachToPreviousMaek atIndex:3];
    return drawInvocation;
}

- (NSInvocation *)undrawScribbleInvocation {
    NSMethodSignature *unexecuMethodsSignture = [self.scribble methodSignatureForSelector:@selector(removeMark:)];
    NSInvocation *unDrawInvocation = [NSInvocation invocationWithMethodSignature:unexecuMethodsSignture];
    [unDrawInvocation setTarget:self.scribble];
    [unDrawInvocation setSelector:@selector(removeMark:)];
    
    return unDrawInvocation;
}

- (void)executeInvocation:(NSInvocation *)invocation withUndoInvocation:(NSInvocation *)undoInvocation {
    [invocation retainArguments];
    
    [[self.undoManager prepareWithInvocationTarget:self] unexecuteInvocation:undoInvocation withRedoInvocation:invocation];
    
    [invocation invoke];
}

- (void)unexecuteInvocation:(NSInvocation *)invocation withRedoInvocation:(NSInvocation *)redoInvocation {
    [[self.undoManager prepareWithInvocationTarget:self] executeInvocation:redoInvocation withUndoInvocation:invocation];
    [invocation invoke];
}

#pragma mark - set
- (void)setScribble:(Scribble *)scribble {
    _scribble = scribble;
    [scribble addObserver:self forKeyPath:@"mark" options:NSKeyValueObservingOptionInitial | NSKeyValueObservingOptionNew context:nil];
}

- (void)setStrokeSize:(CGFloat)strokeSize {
    if (strokeSize < 5.0) {
        strokeSize = 5.0;
    }
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
