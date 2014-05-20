//
//  nTableViewCell.h
//  Scorter - Score Counter
//
//  Created by Naser Mokkary on 4/27/14.
//  Copyright (c) 2014 Naser Mokkary. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface nTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *lblTitle;

@property (weak, nonatomic) IBOutlet UILabel *lblScore;

@property (weak, nonatomic) IBOutlet UIButton *increaseBtn;

@property (weak, nonatomic) IBOutlet UIButton *decreaseBtn;


@end

