//
//  ThumbnailViewController.m
//  TouchPainter
//
//  Created by EGLS_BMAC on 2020/9/23.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//

#import "ThumbnailViewController.h"
#import "ScribbleManager.h"
#import "ScribbleThumbnailTableViewCell.h"

static NSString *ThumnailViewCell = @"ThumnailViewCell";

@interface ThumbnailViewController ()<UITableViewDelegate,UITableViewDataSource>

/** scribbleManager */
@property (nonatomic,strong) ScribbleManager *scribbleManager;
@property (weak, nonatomic) IBOutlet UITableView *thumbnailTableView;

@end

@implementation ThumbnailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setupUI];
}

#pragma mark - Target
- (IBAction)touchDown:(UIBarButtonItem *)sender {
    ((void (*)(id, SEL,id))objc_msgSend)((id)[CoordinatingController sharedInstance], @selector(requestViewChangeByObject:),self);
}

#pragma mark - UITableViewDelegate & UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    CGFloat numberofPlaceHolders = [ScribbleThumbnailTableViewCell numberOfPlaceHolders];
    NSInteger numberOfScribble = [self.scribbleManager numberOfScribbles];
    NSInteger numberofRows = ceil(numberOfScribble/numberofPlaceHolders);
    return numberofRows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ScribbleThumbnailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ThumnailViewCell];
    NSInteger numberOfsuppertedThumnails = [ScribbleThumbnailTableViewCell numberOfPlaceHolders];
    NSUInteger rowIndex = [indexPath row];
    NSInteger thumnailIndex = rowIndex * numberOfsuppertedThumnails;
    NSInteger numberOfScribbles = [self.scribbleManager numberOfScribbles];
    for (NSInteger i = 0; i < numberOfsuppertedThumnails && (thumnailIndex + i) < numberOfScribbles; i ++) {
        UIView *scribbleThumnail = [self.scribbleManager scribbleThumbailViewAtIndex:(thumnailIndex + i)];
        [cell addThumnailView:scribbleThumnail atIndex:i];
    }
    
    return cell;
}

#pragma mark - UI
- (void)setupUI {
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background_texture"]];
    NSInteger numberOfScribble = [self.scribbleManager numberOfScribbles];
    self.title = [NSString stringWithFormat:@"%ld %@",(long)numberOfScribble,(numberOfScribble > 1 ? @"items" : @"item")];
    self.thumbnailTableView.delegate = self;
    self.thumbnailTableView.dataSource = self;
    [self.thumbnailTableView registerNib:[UINib nibWithNibName:@"ScribbleThumbnailTableViewCell" bundle:nil] forCellReuseIdentifier:ThumnailViewCell];
}

#pragma mark - lazy
- (ScribbleManager *)scribbleManager {
    if (!_scribbleManager) {
        _scribbleManager = [[ScribbleManager alloc] init];
    }
    return _scribbleManager;
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
