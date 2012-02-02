TextFieldScroller
=======================

The BaseScrollController base controller is intended to do automatically scroll text fields so that the keyboard does not cover them while editing in an iOS application.  The BaseScrollController also automatically resigns first responder.

Usage
----------------------

In your UIViewController, inherit from BaseScrollController.  In your UIView, add a scroll view and connect it to the scrollView outlet.  Inside the scroll view, connect each textfield's delegate to the File's Owner.  If you wish to override behavior, simply implement one of the following methods:

* textFieldShouldReturn
* textFieldDidBeginEditing
* textFieldDidBeginEditing

More Information
----------------------

https://developer.apple.com/library/ios/#documentation/StringsTextFonts/Conceptual/TextAndWebiPhoneOS/KeyboardManagement/KeyboardManagement.html

http://developer.apple.com/library/ios/#documentation/uikit/reference/UITextFieldDelegate_Protocol/UITextFieldDelegate/UITextFieldDelegate.html
