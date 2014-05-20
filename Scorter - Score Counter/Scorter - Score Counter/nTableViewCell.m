//
//  nTableViewCell.m
//  Scorter - Score Counter
//
//  Created by Naser Mokkary on 4/27/14.
//  Copyright (c) 2014 Naser Mokkary. All rights reserved.
//

#import "nTableViewCell.h"

@implementation nTableViewCell

@synthesize lblTitle;
@synthesize lblScore;
@synthesize increaseBtn;
@synthesize decreaseBtn;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
