//
//  ShortyViewController.m
//  Shorty
//
//  Created by neil on 2014/5/12.
//
//

#import "ShortyViewController.h"

@interface ShortyViewController ()
{
    NSURLConnection *shortenURLConnection;
    NSMutableData *shortURLData;
}
@end
#define kGoDaddyAccountKey @"dd0b771588e04b3f8eec4f26cb6fd10e"
@implementation ShortyViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)loadLocation:(id)sender
{
    NSString *urlText = self.urlField.text;
    if (![urlText hasPrefix:@"http:"] && ![urlText hasPrefix:@"https:"]) {
        if (![urlText hasPrefix:@"//"])
            urlText = [@"//" stringByAppendingString:urlText];
        urlText = [@"http:" stringByAppendingString:urlText];
    }
    NSURL *url = [NSURL URLWithString:urlText];
    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    self.shortenButton.enabled = NO;
}


- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    self.shortenButton.enabled = YES;
    self.urlField.text = webView.request.URL.absoluteString;
    NSString *urlToShorten = self.webView.request.URL.absoluteString;
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSString *message = [NSString stringWithFormat: @"A problem occurred trying to load this page: %@", error.localizedDescription];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Could not load URL" message:message delegate:nil cancelButtonTitle:@"That's Sad" otherButtonTitles:nil];
    [alert show];
}

- (IBAction)shortenURL:(id)sender
{
    NSString *urlToShorten = self.webView.request.URL.absoluteString;
    NSString *urlString = [NSString stringWithFormat:@"http://api.x.co/Squeeze.svc/text/%@?url=%@", kGoDaddyAccountKey,[urlToShorten stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    shortURLData = [NSMutableData new];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    shortenURLConnection = [NSURLConnection connectionWithRequest:request delegate:self];
    self.shortenButton.enabled = NO;
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    self.shortLabel.title = @"failed";
    self.clipboardButton.enabled = NO;
    self.shortenButton.enabled = YES;
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [shortURLData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSString *shortURLString = [[NSString alloc] initWithData:shortURLData encoding:NSUTF8StringEncoding];
    self.shortLabel.title = shortURLString;
    self.clipboardButton.enabled = YES;
}

- (IBAction)clipboardURL:(id)sender
{
    NSString *shortURLString = self.shortLabel.title;
    NSURL *shortURL = [NSURL URLWithString:shortURLString];
    [[UIPasteboard generalPasteboard] setURL:shortURL];
}
@end
