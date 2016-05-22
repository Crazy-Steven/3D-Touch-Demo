//
//  PeekAndPopViewController.m
//  3D Touch-Demo
//
//  Created by 郭艾超 on 16/5/22.
//  Copyright © 2016年 Steven. All rights reserved.
//

#import "PeekAndPopViewController.h"
@interface PeekAndPopViewController()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *pressureLabel;

@end
@implementation PeekAndPopViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    _nameLabel.text = _name;
}

- (IBAction)goBackView:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (NSArray<id<UIPreviewActionItem>> *)previewActionItems {
    // setup a list of preview actions
    UIPreviewAction *action1 = [UIPreviewAction actionWithTitle:@"Aciton1" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        //fountion
    }];
    
    UIPreviewAction *action2 = [UIPreviewAction actionWithTitle:@"Aciton2" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        //fountion
    }];
    
    NSArray *actions = @[action1,action2];
    
    return actions;
}

//按住移动or压力值改变时的回调
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSArray *arrayTouch = [touches allObjects];
    
    UITouch *touch = (UITouch *)[arrayTouch lastObject];
    
    if (touch.view == self.view) {
        //显示压力值
        _pressureLabel.text = [NSString stringWithFormat:@"压力值:%f",touch.force];
    }
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    _pressureLabel.text = nil;
}
@end
