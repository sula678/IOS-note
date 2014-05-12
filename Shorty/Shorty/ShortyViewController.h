//
//  ShortyViewController.h
//  Shorty
//
//  Created by neil on 2014/5/12.
//
//

#import <UIKit/UIKit.h>

@interface ShortyViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *urlField;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
- (IBAction)loadLocation:(id)sender;
@end
