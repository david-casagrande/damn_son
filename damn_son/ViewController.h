//
//  ViewController.h
//  damn_son
//
//  Created by David Casagrande AH on 7/15/13.
//  Copyright (c) 2013 David Casagrande. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController {
}

@property (nonatomic, strong) AVAudioPlayer *player;
@property (nonatomic) BOOL isPlaying;
@property (strong, nonatomic) UIImageView *bgImage;

- (void) playSound;

@end
