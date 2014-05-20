//
//  nDetailViewController.m
//  Scorter - Score Counter
//
//  Created by Naser Mokkary on 4/27/14.
//  Copyright (c) 2014 Naser Mokkary. All rights reserved.
//

#import "nDetailViewController.h"

@interface nDetailViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *txtDetailText;

@end

@implementation nDetailViewController

@synthesize selectedRowTitle;
//@synthesize indexPath;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)btnCancel:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)btnSave:(id)sender {
    [self.delegate changeTextFieldWithIndexPath:self.indexPath content:self.txtDetailText.text];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.txtDetailText.delegate = self;
    self.txtDetailText.text = selectedRowTitle;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    //[self.delegate changeTextFieldWithIndexPath:self.indexPath content:self.txtDetailText.text];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
