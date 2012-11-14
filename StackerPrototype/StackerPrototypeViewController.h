//
//  StackerPrototypeViewController.h
//  StackerPrototype
//
//  Created by Randy Huynh on 11/11/12.
//  Copyright (c) 2012 Randy Huynh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StackerPrototypeViewController : UIViewController {
    IBOutlet UIImageView *row1;
    IBOutlet UIImageView *row2;
    IBOutlet UIImageView *row3;
    IBOutlet UIImageView *row4;
    IBOutlet UIImageView *row5;
    IBOutlet UIImageView *row6;
    IBOutlet UIImageView *row7;
    IBOutlet UIImageView *row8;
    IBOutlet UIImageView *row9;
    IBOutlet UIImageView *row10;
    IBOutlet UILabel *feedback;
}

- (IBAction) stop;
- (IBAction) reset;
- (UIImageView*) setRow;
- (NSTimer*) startTimer;
- (void) position;

@end
