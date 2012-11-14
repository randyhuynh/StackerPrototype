//
//  StackerPrototypeViewController.m
//  StackerPrototype
//
//  Created by Randy Huynh on 11/11/12.
//  Copyright (c) 2012 Randy Huynh. All rights reserved.
//

#import "StackerPrototypeViewController.h"

int row_count;
UIImageView *row; // Keeps track of what row to animate.
int row_position;
NSTimer *timer;
float speed;
int previous_position;
bool reverse;
int position;

@interface StackerPrototypeViewController ()

@end

@implementation StackerPrototypeViewController

- (IBAction) stop {
    [timer invalidate]; // Stops current timer.
    
    if (row_count == 1 || position == previous_position) {
        feedback.text = @"Nice job!";
        row_count++; // Moves onto next row.
        previous_position = position;
        
        if (row_count < 4) {
            speed = 0.2;
        } else if (row_count < 7) {
            speed = 0.15;
        } else if (row_count < 10) {
            speed = 0.1;
        } else {
            speed = 0.05;
        }
        
        row = [self setRow]; // Set the row we're working with.
        timer = [self startTimer]; // Animate that row.
    } else {
        feedback.text = @"Too bad!";
    }
}

- (IBAction) reset {
    [timer invalidate]; // Stops current timer.
    feedback.text = @"Stack to the top!";
    row1.image = [UIImage imageNamed: @"blank.png"];
    row2.image = [UIImage imageNamed: @"blank.png"];
    row3.image = [UIImage imageNamed: @"blank.png"];
    row4.image = [UIImage imageNamed: @"blank.png"];
    row5.image = [UIImage imageNamed: @"blank.png"];
    row6.image = [UIImage imageNamed: @"blank.png"];
    row7.image = [UIImage imageNamed: @"blank.png"];
    row8.image = [UIImage imageNamed: @"blank.png"];
    row9.image = [UIImage imageNamed: @"blank.png"];
    row10.image = [UIImage imageNamed: @"blank.png"];
    reverse = false;
    row_count = 1;
    speed = 0.5;
    row = row1; // Set the row we're working with.
    timer = [self startTimer]; // Animate that row.
}

- (UIImageView*) setRow {
    if (row_count == 1) {
        return row1;
    } else if (row_count == 2) {
        return row2;
    } else if (row_count == 3) {
        return row3;
    } else if (row_count == 4) {
        return row4;
    } else if (row_count == 5) {
        return row5;
    } else if (row_count == 6) {
        return row6;
    } else if (row_count == 7) {
        return row7;
    } else if (row_count == 8) {
        return row8;
    } else if (row_count == 9) {
        return row9;
    } else if (row_count == 10) {
        return row10;
    } else {
        [timer invalidate]; 
        feedback.text = @"You win!";
    }
}

- (NSTimer*) startTimer {
    row_position = 0;
    return [NSTimer scheduledTimerWithTimeInterval:speed
                                     target:self
                                   selector:@selector(position)
                                   userInfo:nil
                                    repeats:YES];
}

- (void) position {
    if (row_position % 5 == 0) {
        row.image = [UIImage imageNamed: @"01.png"];
        position = 1;
        reverse = false;
    } else if (row_position % 5 == 1) {
        row.image = [UIImage imageNamed: @"02.png"];
        position = 2;
    } else if (row_position % 5 == 2) {
        row.image = [UIImage imageNamed: @"03.png"];
        position = 3;
    } else if (row_position % 5 == 3) {
        row.image = [UIImage imageNamed: @"04.png"];
        position = 4;
    } else if (row_position % 5 == 4) {
        row.image = [UIImage imageNamed: @"05.png"];
        position = 5;
        reverse = true;
    } else {
        feedback.text = @"Error has occured";
    }
    
    if (!reverse) {
        row_position++;
    } else {
        row_position--;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    row1.image = [UIImage imageNamed: @"blank.png"];
    row2.image = [UIImage imageNamed: @"blank.png"];
    row3.image = [UIImage imageNamed: @"blank.png"];
    row4.image = [UIImage imageNamed: @"blank.png"];
    row5.image = [UIImage imageNamed: @"blank.png"];
    row6.image = [UIImage imageNamed: @"blank.png"];
    row7.image = [UIImage imageNamed: @"blank.png"];
    row8.image = [UIImage imageNamed: @"blank.png"];
    row9.image = [UIImage imageNamed: @"blank.png"];
    row10.image = [UIImage imageNamed: @"blank.png"];
    
    reverse = false;
    
    row_count = 1;
    speed = 0.5;
    row = row1; // Set the row we're working with.
    timer = [self startTimer]; // Animate that row.
    feedback.text = @"Stack to the top!";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
