//
//  ShortyViewController.h
//  Shorty
//
//  Created by neil on 2014/5/12.
//
//

#import <UIKit/UIKit.h>

@interface ShortyViewController : UIViewController <UIWebViewDelegate, NSURLConnectionDelegate, NSURLConnectionDataDelegate>
@property (weak, nonatomic) IBOutlet UITextField *urlField;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
- (IBAction)loadLocation:(id)sender;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *shortenButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *shortLabel;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *clipboardButton;
- (IBAction)shortenURL:(id)sender;
- (IBAction)clipboardURL:(id)sender;
@end
