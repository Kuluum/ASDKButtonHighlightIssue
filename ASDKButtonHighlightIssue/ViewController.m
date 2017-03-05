//
//  ViewController.m
//  ASDKButtonHighlightIssue
//
//  Created by DNosov on 05.03.17.
//  Copyright © 2017 Kuluum. All rights reserved.
//

#import "ViewController.h"


@interface MyNode: ASDisplayNode
@property (weak, nonatomic) ASViewController *parentVC;
@property (strong, nonatomic) ASButtonNode *buttnoNode;
@end

@interface ViewController ()
@end

@implementation ViewController
- (instancetype)init {
    MyNode *rootNode = [[MyNode alloc] init];
    rootNode.parentVC = self;
    self = [super initWithNode:rootNode];
    
    return self;
}
@end

@implementation MyNode

- (instancetype)init {
    self = [super init];
    
    if (self) {
        self.automaticallyManagesSubnodes = YES;
        
        _buttnoNode = [[ASButtonNode alloc] init];
        [_buttnoNode setTitle:@"Normal" withFont:nil withColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_buttnoNode setTitle:@"Highlighted" withFont:nil withColor:[UIColor redColor] forState:UIControlStateHighlighted];
        
        // Important: Bug reproduced on TouchDown event, on TouchUpInside everything OK.
        [_buttnoNode addTarget:self action:@selector(pushAnotherVC) forControlEvents:ASControlNodeEventTouchDown];
        
        _buttnoNode.style.flexShrink = YES;
        
    }
    return self;
}

-(ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    return [[ASCenterLayoutSpec alloc] initWithHorizontalPosition:ASRelativeLayoutSpecPositionCenter
                                                 verticalPosition:ASRelativeLayoutSpecPositionCenter
                                                     sizingOption:ASRelativeLayoutSpecSizingOptionDefault
                                                            child:_buttnoNode];
}

         
- (void)pushAnotherVC {
    ViewController *vc = [[ViewController alloc] init];
    [_parentVC.navigationController pushViewController:vc animated:YES];
}-A

@end
