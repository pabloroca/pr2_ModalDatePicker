//
//  ViewController.h
//  pr2_ModalDatePickerSample
//
//  Created by Pablo Roca Rozas on 29/12/12.
//  Copyright (c) 2012 Pablo Roca Rozas. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "pr2_ModalDatePicker.h"

@interface ViewController : UIViewController <pr2_ModalDatePickerDelegate>

@property (strong, nonatomic) IBOutlet UILabel *lbldate;
@property (strong, nonatomic) NSDate *mydate;

@property (strong, nonatomic) NSDateFormatter *dateFormatter;

- (IBAction)btndatePicker:(id)sender;

@end
