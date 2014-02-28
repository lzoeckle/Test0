//
//  stepperViewController.m
//  Test0
//
//  Created by Leo Zoeckler on 2/20/14.
//  Copyright (c) 2014 Leo Zoeckler. All rights reserved.
//

#import "stepperViewController.h"

@interface stepperViewController ()

@end

@implementation stepperViewController

- (void)startTimer {
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(countUp) userInfo:nil repeats:YES];
}

- (IBAction)valueChanged:(UIStepper *)sender
{
    double value = [sender value];
    [myLabel setText:[NSString stringWithFormat:@"%d", (int)value]];
    if (first){
        mainInt = 0;
        [self startTimer];
        first = false;
        float labelVal = [[myLabel text] floatValue];
        [bacLabel setText:[NSString stringWithFormat:@"%f", (((labelVal * 3.084) / 109.5) - (0.15 * (mainInt / 3600)))]];
    } else {
        float labelVal = [[myLabel text] floatValue];
        [bacLabel setText:[NSString stringWithFormat:@"%f", (((labelVal * 3.084) / 109.5) - (0.15 * (mainInt / 3600)))]];
    }
}

- (IBAction)addNight:(UIButton *)sender
{
    first = true;
    mainInt = 0;
    NSDate *currentTime = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH:mm:ss"];
    NSString *time = [dateFormatter stringFromDate: currentTime];
    [timeLabel setText:time];
}

- (void) countUp {
    NSDate *cTime = [NSDate date];
    NSDateFormatter *dFormatter = [[NSDateFormatter alloc] init];
    [dFormatter setDateFormat:@"HH:mm:ss"];
    NSString *t = [dFormatter stringFromDate: cTime];
    [timeLabel setText: t];
    mainInt += 1;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    first = true;
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end