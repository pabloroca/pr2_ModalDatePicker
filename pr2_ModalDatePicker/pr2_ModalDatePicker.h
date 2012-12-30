//
// pr2_ModalDatePicker.h
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

@protocol pr2_ModalDatePickerDelegate
@required
-(void)pr2datePickerClear;
-(void)pr2datePickerSave:(NSDate *)tdate;
@optional
-(void)pr2datePickerCancel;
@end

@interface pr2_ModalDatePicker : UIViewController

@property (assign, nonatomic) id <pr2_ModalDatePickerDelegate> delegate;

//UI
@property (strong, nonatomic) IBOutlet UIView *view;
@property (strong, nonatomic) IBOutlet UIView *viewbackground;

@property (strong, nonatomic) IBOutlet UIToolbar *toolbar;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *btnCancel;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *btnClear;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *btnSave;

@property (strong, nonatomic) IBOutlet UIDatePicker *datepicker;
//UI

// public methods available
-(void)presentModalwithDate:(NSDate *)tdate;
-(void)hideClearButton;

// actions from toolbar buttons
- (IBAction)cancelDate:(id)sender;
- (IBAction)clearDate:(id)sender;
- (IBAction)saveDate:(id)sender;

@end
