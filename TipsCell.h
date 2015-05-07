//
//  TipsCell.h
//  Preppd
//
//  Created by ITP Student on 2/17/15.
//  Copyright (c) 2015 ITP Student. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TipsCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

@property (weak, nonatomic) IBOutlet UIView *cardView;

@end
