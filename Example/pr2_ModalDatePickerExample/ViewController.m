//
//  ViewController.m
//  pr2_ModalDatePickerSample
//
//  Created by Pablo Roca Rozas on 29/12/12.
//  Copyright (c) 2012 Pablo Roca Rozas. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

-(BOOL)shouldAutorotate
{
	return YES;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
	return UIInterfaceOrientationMaskPortrait;
}

- (void)viewDidLoad
{
   [super viewDidLoad];

	self.mydate =[NSDate date];
	self.dateFormatter = [[NSDateFormatter alloc] init];
	[self.dateFormatter setDateFormat:@"dd MMM yyyy"];
	
	self.lbldate.text = [self.dateFormatter stringFromDate:self.mydate];
}

#pragma mark - Action when Open datapicker button is selected

- (IBAction)btndatePicker:(id)sender
{
	pr2_ModalDatePicker *datePicker = [[pr2_ModalDatePicker alloc] initWithNibName:@"pr2_ModalDatePicker" bundle:nil];
	
	datePicker.delegate = self;
	
	[datePicker presentModalwithDate:self.mydate];
	
	// set the current date
	//	[datePicker presentModalwithDate:nil];

	// UI customizations
	datePicker.toolbar.tintColor = [UIColor colorWithRed:14.0/255.0 green:61.0/255.0 blue:117.0/255.0 alpha:1.0];
	//	[datePicker hideClearButton];
	
}

#pragma mark - pr2_ModalDatePickerDelegate

-(void)pr2datePickerCancel
{
}

-(void)pr2datePickerClear
{
	self.lbldate.text = @"";
	self.mydate = nil;
}

-(void)pr2datePickerSave:(NSDate *)tdate
{
	self.lbldate.text = [self.dateFormatter stringFromDate:tdate];
	self.mydate = tdate;
}

@end
