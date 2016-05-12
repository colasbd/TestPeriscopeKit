//
//  ViewController.m
//  TestPeriscopeLike
//
//  Created by Colas on 12/05/2016.
//  Copyright © 2016 Colas. All rights reserved.
//

#import "ViewController.h"
#import <SpriteKit/SpriteKit.h>


static CGFloat const kHeight = 18.0f;


@interface CBDHeartBubbleScene : SKScene

@property (nonatomic, strong, readwrite) SKEmitterNode *emitter;

- (void)beginBubbling;

@end


@implementation CBDHeartBubbleScene

- (void)beginBubbling
{
    self.emitter = [SKEmitterNode nodeWithFileNamed:@"heart-bubbles"];
    
    CGFloat x = floor(self.size.width / 2.0f);
    CGFloat y = kHeight;
    
    self.emitter.position = CGPointMake(x, y);
    self.emitter.name = @"heart-bubbles";
    self.emitter.targetNode = self;
    
    self.emitter.numParticlesToEmit = 1;
    
    [self addChild:self.emitter];
    
    [self.emitter resetSimulation];
}

@end



@interface ViewController ()
@property (weak, nonatomic) IBOutlet SKView *heartBubbleView;
@property (nonatomic, strong, readwrite) CBDHeartBubbleScene *heartBubblesScene;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.heartBubblesScene = [[CBDHeartBubbleScene alloc] initWithSize:self.heartBubbleView.frame.size];
    [self.heartBubblesScene setScaleMode:SKSceneScaleModeFill];
    self.heartBubblesScene.backgroundColor = [UIColor clearColor];
    
    self.heartBubbleView.allowsTransparency = YES;
    
    [self.heartBubbleView presentScene:self.heartBubblesScene];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    [self.heartBubblesScene beginBubbling];
//}

- (IBAction)action:(id)sender
{
    [self.heartBubblesScene beginBubbling];
}
@end
