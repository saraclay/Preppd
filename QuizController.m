//
//  QuizController.m
//  Preppd
//
//  Created by ITP Student on 2/16/15.
//  Copyright (c) 2015 ITP Student. All rights reserved.
//

#import "QuizController.h"
#import "DraggableViewBackground.h"


@interface QuizController ()
@end

@implementation QuizController

- (void)viewDidLoad
{
    [super viewDidLoad];
    DraggableViewBackground *draggableBackground = [[DraggableViewBackground alloc]initWithFrame:self.view.frame];
    [self.view addSubview:draggableBackground];

}

@end
