//
//  ViewController.m
//  pinchRotate
//
//  Created by trung bao on 28/11/2015.
//  Copyright © 2015 baotrung. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIGestureRecognizerDelegate>

@end

@implementation ViewController {
    UIPinchGestureRecognizer *pinch;
    UIRotationGestureRecognizer *rotate;
    UIImageView *image;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pinch"]];
    image.center = CGPointMake(self.view.bounds.size.width *0.5, self.view.bounds.size.height * 0.5);
    [self.view addSubview:image];
    image.multipleTouchEnabled = true;
    image.userInteractionEnabled = true;
    pinch.delegate = self;
    rotate.delegate = self;
    pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchimages:)];
    [self.view addGestureRecognizer:pinch];
    rotate = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotateimages:)];
    [self.view addGestureRecognizer:rotate];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void) pinchimages:(UIPinchGestureRecognizer *) pinchs {
    if (pinchs.state == UIGestureRecognizerStateBegan || pinchs.state == UIGestureRecognizerStateChanged) {
        image.transform = CGAffineTransformScale(image.transform, pinchs.scale, pinchs.scale);
        pinchs.scale = 1.0;
        NSLog(@"pinch");
    }
}
- (void) rotateimages: (UIRotationGestureRecognizer *) rotates {
    if (rotates.state == UIGestureRecognizerStateChanged || rotates.state == UIGestureRecognizerStateBegan) {
        image.transform = CGAffineTransformRotate(image.transform, rotates.rotation);
        rotates.rotation = 0.0;
        NSLog(@"rotate");
    }
}
/*- (BOOL) gestureRecognizer: (UIGestureRecognizer *)gestureRecognizer shouldRequireFailureOfGestureRecognizer:
(nonnull UIGestureRecognizer *)otherGestureRecognizer
{
    if ([gestureRecognizer isMemberOfClass:[UIPinchGestureRecognizer class]] && [otherGestureRecognizer isMemberOfClass:[UIRotationGestureRecognizer class]]) {
        return true;
    }else {
        return false;
    }
}*/
@end
