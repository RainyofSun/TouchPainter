//
//  ScribbleManager.m
//  TouchPainter
//
//  Created by EGLS_BMAC on 2020/9/27.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//

#import "ScribbleManager.h"
#import "OpenScribbleCommand.h"

#define kScribbleDataPath [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/data"]
#define kScribbleThumbnailPath [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/thumbnails"]

@implementation ScribbleManager

- (void)dealloc {
    NSLog(@"DELLOC : %@",NSStringFromClass(self.class));
}

- (void)saveScribble:(Scribble *)scribble thumnail:(UIImage *)image {
    NSInteger newIndex = [self numberOfScribbles] + 1;
    NSString *scribbleDataName = [NSString stringWithFormat:@"data_%ld",newIndex];
    NSString *scribbleThumnailName = [NSString stringWithFormat:@"thumnail_%ld.png",newIndex];
    
    ScribbleMemento *scribbleMemento = [scribble scribbleMemento];
    NSData *mementoData = [scribbleMemento data];
    NSString *mementoPath = [[self scribbleDataPath] stringByAppendingPathComponent:scribbleDataName];
    [mementoData writeToFile:mementoPath atomically:YES];
    
    NSData *imageData = [NSData dataWithData:UIImagePNGRepresentation(image)];
    NSString *imagePath = [[self scribbleThumnailPath] stringByAppendingPathComponent:scribbleThumnailName];
    [imageData writeToFile:imagePath atomically:YES];
}

- (NSInteger)numberOfScribbles {
    return [[self scribbleDataPaths] count];
}

- (Scribble *)scribbleAtIndex:(NSInteger)index {
    Scribble *loadeScribble = nil;
    NSArray *scribbleDataPathsArray = [self scribbleDataPaths];
    
    NSString *scribblePath = [scribbleDataPathsArray objectAtIndex:index];
    if (scribblePath) {
        NSData *scribbleData = [[NSFileManager defaultManager] contentsAtPath:[kScribbleDataPath stringByAppendingPathComponent:scribblePath]];
        ScribbleMemento *scribbleMemento = [ScribbleMemento mementoWithData:scribbleData];
        loadeScribble = [Scribble scribbleWithMemento:scribbleMemento];
    }
    
    return loadeScribble;
}

- (UIView *)scribbleThumbailViewAtIndex:(NSInteger)index {
    
    
    return nil;
}

#pragma mark - private methods
- (NSString *)scribbleDataPath {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:kScribbleDataPath]) {
        [fileManager createDirectoryAtPath:kScribbleDataPath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    return kScribbleThumbnailPath;
}

- (NSString *)scribbleThumnailPath {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:kScribbleThumbnailPath]) {
        [fileManager createDirectoryAtPath:kScribbleThumbnailPath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    return kScribbleThumbnailPath;
}

- (NSArray *)scribbleDataPaths {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    NSArray *scribbleDataPathArray = [fileManager contentsOfDirectoryAtPath:[self scribbleDataPath] error:&error];
    return scribbleDataPathArray;
}

- (NSArray *)scribblesThumnailPaths {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    NSArray *scribbleThumnailPathsArray = [fileManager contentsOfDirectoryAtPath:[self scribbleThumnailPath] error:&error];
    return scribbleThumnailPathsArray;
}

@end
