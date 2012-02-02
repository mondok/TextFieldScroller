//
//  BaseScrollController.h
//  TextScroller
//
//  Created by Matthew Mondok on 2/1/12.
//

#import <UIKit/UIKit.h>

@interface BaseScrollController : UIViewController<UITextFieldDelegate>{
    IBOutlet UITextField *__activeField;
    IBOutlet UIScrollView *scrollView;
}

@end
