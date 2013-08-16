//
//  ViewController.m
//  damn_son
//
//  Created by David Casagrande AH on 7/15/13.
//  Copyright (c) 2013 David Casagrande. All rights reserved.
//

#import "ViewController.h"
#define ASSET_BY_SCREEN_HEIGHT(regular) (([[UIScreen mainScreen] bounds].size.height <= 480.0) ? regular : [regular stringByAppendingString:@"-568h"])

@interface ViewController ()

@end

@implementation ViewController
@synthesize player;
@synthesize label;

- (void)viewDidLoad
{
    
    
    [super viewDidLoad];
    
    
    UIImage *image = [UIImage imageNamed:ASSET_BY_SCREEN_HEIGHT(@"damnSon")];
    self.bgImage = [[UIImageView alloc] initWithImage: image];
    [self.view insertSubview:self.bgImage atIndex:0];

    self.isPlaying = NO;
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"damnSon" withExtension:@"wav"];
    NSAssert(url, @"URL is valid.");    
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [self.player prepareToPlay];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) playSound {
    if (self.isPlaying)
    {        
        // Music is currently playing
        [self.player stop];
        self.isPlaying = NO;
        [self playSound];
    } else
    {
        // Music is currenty paused/stopped
        self.player.currentTime = 0;
        [self.player play];
        self.isPlaying = YES;
    }
}

- (BOOL) canBecomeFirstResponder {
    return YES;
}

-(void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if( motion == UIEventSubtypeMotionShake) {
        [self playSound];
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self playSound];
}


@end
