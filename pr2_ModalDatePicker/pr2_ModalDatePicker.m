//
// pr2_ModalDatePicker.m
//
// Copyright (c) 2013 Pablo Roca Rozas & PR2Studio (http://www.pr2studio.com)
// All rights reserved
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "pr2_ModalDatePicker.h"

@interface pr2_ModalDatePicker ()
@end

@implementation pr2_ModalDatePicker

- (void)didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];
}

-(BOOL)shouldAutorotate
{
	return YES;
}

#pragma mark - Load view

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	// we need to set the subview dimensions or it will not always render correctly
	// http://stackoverflow.com/questions/1088163
	for (UIView* subview in self.datepicker.subviews)
	{
		subview.frame = self.datepicker.bounds;
	}
}

#pragma mark - Show view

-(void)presentModalwithDate:(NSDate *)tdate
{
	UIViewController *rootViewController = UIApplication.sharedApplication.delegate.window.rootViewController;
	UIView *rootView = rootViewController.view;
	
	[rootView addSubview:self.view];

	// for UIViewController Containment
	[rootViewController addChildViewController:self];
	[self didMoveToParentViewController:rootViewController];

	CGRect mainrect = rootView.bounds;
	CGRect newRect = CGRectMake(0, mainrect.size.height, mainrect.size.width, mainrect.size.height);

	self.view.frame = newRect;

	if(tdate == nil)
	{
		tdate = [NSDate date];
	}
	[self.datepicker setDate:tdate animated:NO];

	[UIView animateWithDuration:0.4
						  animations:^{
							  self.view.frame = mainrect;
						  } completion:^(BOOL finished) {
							  //nop
							  [UIView animateWithDuration:0.2
													 animations:^{
														 self.viewbackground.alpha = 0.5;
													 } completion:^(BOOL finished) {
														 //nop
													 }];
						  }];

}

#pragma mark - Remove view

-(void)remove
{
	UIView *rootView = UIApplication.sharedApplication.delegate.window.rootViewController.view;

	CGRect mainrect = rootView.bounds;
	CGRect newRect = CGRectMake(0, mainrect.size.height, mainrect.size.width, mainrect.size.height);

	[UIView animateWithDuration:0.2
						  animations:^{
							  self.viewbackground.alpha = 0;
						  } completion:^(BOOL finished) {
							  //nop
							  [UIView animateWithDuration:0.4
													 animations:^{
														 self.view.frame = newRect;
													 } completion:^(BOOL finished) {
														 [self.view removeFromSuperview];
														 [self removeFromParentViewController];
													 }];
						  }];

}

#pragma mark - Hide Clear Button

-(void)hideClearButton;
{
	self.btnClear.title = @"";
	[self.btnClear setStyle: UIBarButtonItemStylePlain];
	[self.btnClear setEnabled:false];
}

#pragma mark - Actions from toolbar buttons

- (IBAction)cancelDate:(id)sender
{
	[self.delegate pr2datePickerCancel];
	[self remove];
}

- (IBAction)clearDate:(id)sender
{
	[self.delegate pr2datePickerClear];
	[self remove];
}

- (IBAction)saveDate:(id)sender
{
	[self.delegate pr2datePickerSave:[self.datepicker date]];
	[self remove];
}

@end
