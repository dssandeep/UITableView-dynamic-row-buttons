//
//  nViewController.h
//  Scorter - Score Counter
//
//  Created by Naser Mokkary on 4/27/14.
//  Copyright (c) 2014 Naser Mokkary. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "nDetailViewController.h"

@interface nViewController : UIViewController
{
    NSMutableArray *labelScore;

}
@property (nonatomic,strong) NSMutableArray *labelScore;

@property (nonatomic,strong) IBOutlet UITableView* _tableView;
//@property (weak, nonatomic) IBOutlet UIButton *btnIncrease;
//@property (weak, nonatomic) IBOutlet UIButton *btnDecrease;

-(IBAction)increaseScore:(id)sender;
-(IBAction)decreaseScore:(id)sender;

@end
