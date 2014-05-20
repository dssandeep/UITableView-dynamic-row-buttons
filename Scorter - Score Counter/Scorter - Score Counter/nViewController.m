//
//  nViewController.m
//  Scorter - Score Counter
//
//  Created by Naser Mokkary on 4/27/14.
//  Copyright (c) 2014 Naser Mokkary. All rights reserved.
//

#import "nViewController.h"
#import "nTableViewCell.h"

@interface nViewController () <NDetailViewControllerDelegate>

@end

@implementation nViewController
{
    NSMutableArray *gamers;
    NSUInteger nTag;
}

@synthesize _tableView,labelScore;

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    nTag = 0;
    gamers = [[NSMutableArray alloc] initWithObjects:@"Player 1", nil];
    self.labelScore = [[NSMutableArray alloc] initWithObjects:@"0", nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [gamers count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
#if 0
    static NSString *tableIdentifier = @"gamerCell";
    nTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableIdentifier];
    if (cell == nil) {
        cell = [[nTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tableIdentifier];
    }
    NSLog(@"index row: %d", indexPath.row);
    cell.lblTitle.text = [gamers objectAtIndex:indexPath.row];
    
    [_btnIncrease addTarget:self action:@selector(increaseScore:) forControlEvents:UIControlEventTouchUpInside];
    
    [_btnDecrease addTarget:self action:@selector(decreaseScore:) forControlEvents:UIControlEventTouchUpInside];
#endif
    
    static NSString *CellIdentifier = @"gamerCell";
    
    nTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
//    UILabel *titleLbl = (UILabel *)[cell viewWithTag:1];
//    titleLbl.text = [gamers objectAtIndex:indexPath.row];
    cell.lblTitle.text =[gamers objectAtIndex:indexPath.row];
    
//    UILabel *detailtileLbl = (UILabel *)[cell viewWithTag:2];
    //NSLog(@"self.labelScore  %@",self.labelScore);
    
//    detailtileLbl.text = [self.labelScore objectAtIndex:indexPath.row];
    cell.lblScore.text =[self.labelScore objectAtIndex:indexPath.row];
    
//    UIButton *btnIncrease = (UIButton *)[cell viewWithTag:3];
//    btnIncrease.tag = nTag;
//    [btnIncrease addTarget:self action:@selector(increaseScore:) forControlEvents:UIControlEventTouchUpInside];
    cell.increaseBtn.tag = nTag;
    
//    UIButton *btnDecrease = (UIButton *)[cell viewWithTag:4];
//    btnDecrease.tag = nTag ;
//    [btnDecrease addTarget:self action:@selector(decreaseScore:) forControlEvents:UIControlEventTouchUpInside];
    cell.decreaseBtn.tag = nTag;
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showGamerDetail"]) {
        NSIndexPath *indexPath = [self._tableView indexPathForSelectedRow];
        nDetailViewController *destinationViewController = segue.destinationViewController;
        destinationViewController.selectedRowTitle = [gamers objectAtIndex:indexPath.row];

        destinationViewController.indexPath = indexPath;
        destinationViewController.delegate = self;
    }
}

- (IBAction)btnAddRow:(id)sender {
    [self.labelScore addObject:@"0"];
    NSString *str = [NSString stringWithFormat:@"Player %d", [self.labelScore count]];
    [gamers addObject:str];

    nTag = nTag + 1;
    
    [_tableView reloadData];
}

- (IBAction)increaseScore:(id)sender {
    
#if 0
    CGPoint buttonPosition = [sender convertPoint:CGPointZero toView:self._tableView];
    NSIndexPath *indexPath = [self._tableView indexPathForRowAtPoint:buttonPosition];
    if (indexPath != nil)
    {
        nTableViewCell *cell = (nTableViewCell *)[self._tableView cellForRowAtIndexPath:indexPath];
        int score = [cell.lblScore.text intValue];
        score++;
        cell.lblScore.text= [NSString stringWithFormat:@"%i",score];
    }
#endif
    
    
    UIButton *senderButton = (UIButton *)sender;
    
    UIView *currentTableView = senderButton.superview;
    while (currentTableView && ![currentTableView isKindOfClass:[UITableView self]])
        currentTableView = currentTableView.superview;
    
    UIView *view = senderButton.superview;
    while (view && ![view isKindOfClass:[UITableViewCell self]]) view = view.superview;
    
    nTableViewCell *cell = (nTableViewCell*)view;
    NSIndexPath *indexpathRow = [self._tableView indexPathForCell:cell];
    

    NSLog(@"rowofthecell %d Increase button", indexpathRow.row);
    NSString *strscore = [self.labelScore objectAtIndex:indexpathRow.row];
    NSInteger score = [strscore integerValue];
    score = score + 1;
    strscore = [NSString stringWithFormat:@"%d", score];
    [self.labelScore replaceObjectAtIndex:indexpathRow.row withObject:strscore];
    [_tableView reloadData];
    
    
//    NSInteger incBtnTag = 0;
//    NSString *strscore;
//    NSInteger score;
//    UIButton *incButton = (UIButton *)sender;
//    
//    incBtnTag = incButton.tag;
//    strscore = [self.labelScore objectAtIndex:incBtnTag];
//    score = [strscore integerValue];
//    score = score + 1;
//    strscore = [NSString stringWithFormat:@"%d", score];
//    
//    [self.labelScore replaceObjectAtIndex:incBtnTag withObject:strscore];
//    [_tableView reloadData];
}

- (IBAction)decreaseScore:(id)sender {
    
#if 0
    CGPoint buttonPosition = [sender convertPoint:CGPointZero toView:self._tableView];
    NSIndexPath *indexPath = [self._tableView indexPathForRowAtPoint:buttonPosition];
    if (indexPath != nil)
    {
        nTableViewCell *cell = (nTableViewCell *)[self._tableView cellForRowAtIndexPath:indexPath];
        int score = [cell.lblScore.text intValue];
        score--;
        cell.lblScore.text= [NSString stringWithFormat:@"%i",score];
    }
#endif
    
    
    UIButton *senderButton = (UIButton *)sender;
    
    UIView *currentTableView = senderButton.superview;
    while (currentTableView && ![currentTableView isKindOfClass:[UITableView self]])
        currentTableView = currentTableView.superview;
    
    UIView *view = senderButton.superview;
    while (view && ![view isKindOfClass:[UITableViewCell self]]) view = view.superview;
    
    nTableViewCell *cell = (nTableViewCell*)view;
    NSIndexPath *indexpathRow = [self._tableView indexPathForCell:cell];
    NSLog(@"rowofthecell Decrease button %d", indexpathRow.row);

    int index = indexpathRow.row ;//- 200;
    NSString *strscore = [self.labelScore objectAtIndex:index];
    NSInteger score = [strscore integerValue];
    score = score - 1;
    strscore = [NSString stringWithFormat:@"%d", score];
    [self.labelScore replaceObjectAtIndex:index withObject:strscore];
    [_tableView reloadData];
    
//    NSInteger decBtnTag = 0;
//    NSString *strscore;
//    NSInteger score;
//    UIButton *decButton = (UIButton *)sender;
//    
//    decBtnTag = decButton.tag;
//    strscore = [self.labelScore objectAtIndex:decBtnTag];
//    score = [strscore integerValue];
//    score = score - 1;
//    strscore = [NSString stringWithFormat:@"%d", score];
//    
//    [self.labelScore replaceObjectAtIndex:decBtnTag withObject:strscore];
//    
//    [_tableView reloadData];
}

-(void)changeTextFieldWithIndexPath : (NSIndexPath*)indexPath content:(NSString*)content;
{
    //nTableViewCell *cell =  ((nTableViewCell*)[self._tableView cellForRowAtIndexPath:indexPath]);
    //cell.lblTitle.text = content;
    
    [gamers replaceObjectAtIndex:indexPath.row withObject:content];
    
    [_tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
