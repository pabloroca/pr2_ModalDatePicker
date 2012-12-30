
# pr2_ModalDatePicker

A modal UIDatePicker with a semi transparent background. The goal was to keep as simple as possible.

![pr2_ModalDatePicker](http://img84.imageshack.us/img84/262/pr2modaldatepicker.png)


## Installation

_**If your project doesn't use ARC**: you must add the `-fobjc-arc` compiler flag to `pr2_ModalDatePicker.m` in Target Settings > Build Phases > Compile Sources._

* Drag the `pr2_ModalDatePicker/pr2_ModalDatePicker` folder into your project.

## Usage

(see sample Xcode project in /Example)

Import pr2_ModalDatePicker.h, set the delegate call presentModalwithDate with the date to be the default for the UIDatePicker and finally use the callback delegates

```objective-c
#import <pr2_ModalDatePicker.h>
@interface myViewController : UIViewController <pr2_ModalDatePickerDelegate>

...

pr2_ModalDatePicker *datePicker = [[pr2_ModalDatePicker alloc] initWithNibName:@"pr2_ModalDatePicker" bundle:nil];
	
datePicker.delegate = self;

NSDate *tdate = [NSDate date];
[datePicker presentModalwithDate:tdate];
```

And set the delegate callbacks


```objective-c
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
```

## Who use it

Find out [who use pr2_ModalDatePicker](https://github.com/pabloroca/pr2_ModalDatePicker/wiki/Who-Use-pr2_ModalDatePicker) and add your app to the list.

## Licenses

All source code is licensed under the MIT License.

## Credits

pr2_ModalDatePicker is brought to you by [Pablo Roca Rozas & PR2Studio](http://www.pr2studio.com) and [contributors to the project](https://github.com/pabloroca/pr2_ModalDatePicker/contributors). If you have feature suggestions or bug reports, feel free to help out by sending pull requests or by [creating new issues](https://github.com/pabloroca/pr2_ModalDatePicker/issues/new). If you're using pr2_ModalDatePicker in your project, attribution would be nice.
