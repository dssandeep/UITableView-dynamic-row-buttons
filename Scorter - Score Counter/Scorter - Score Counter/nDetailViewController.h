//
//  nDetailViewController.h
//  Scorter - Score Counter
//
//  Created by Naser Mokkary on 4/27/14.
//  Copyright (c) 2014 Naser Mokkary. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NDetailViewControllerDelegate <NSObject>
-(void)changeTextFieldWithIndexPath : (NSIndexPath*)indexPath content:(NSString*)content;
@end

@interface nDetailViewController : UIViewController

@property NSString* selectedRowTitle;
@property (nonatomic, weak) id<NDetailViewControllerDelegate> delegate;
@property (nonatomic,strong) NSIndexPath *indexPath;

@end