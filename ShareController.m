//
//  ShareController.m
//  Preppd
//
//  Created by ITP Student on 2/9/15.
//  Copyright (c) 2015 ITP Student. All rights reserved.
//  Social media help: http://ios-blog.co.uk/tutorials/integrating-social-media-in-your-apps/

#import "ShareController.h"
#import "Social/Social.h"
#import "MobileCoreServices/MobileCoreServices.h"

@interface ShareController () <UITextFieldDelegate>

@property (strong, nonatomic) UIActivityViewController *activityViewController;

@property (weak, nonatomic) IBOutlet UIButton *shareButton;

@property (weak, nonatomic) IBOutlet UITextField *textField;

- (IBAction)shareText:(UIButton *)sender;

/*social media*/

@property (weak, nonatomic) IBOutlet UIButton *fbIcon;

@property (weak, nonatomic) IBOutlet UIButton *twitterIcon;

@property (weak, nonatomic) IBOutlet UIButton *chatIcon;

-(IBAction)fbPressed;
-(IBAction)tweetPressed;

@end

@implementation ShareController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.textField.delegate = self;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)shareText:(UIButton *)sender {
    self.activityViewController = [[UIActivityViewController alloc] initWithActivityItems:@[self.textField.text] applicationActivities:nil];
    
    [self presentViewController:self.activityViewController animated:YES completion:nil];
}

-(IBAction)fbPressed{
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook])
    {
        SLComposeViewController *fbPostSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        [fbPostSheet setInitialText:@"Check out this great on-the-go interview app called Preppd App! Check it --> www.twitter.com/preppdapp"];
        [self presentViewController:fbPostSheet animated:YES completion:nil];
    } else
    {
        UIAlertView *alertView = [[UIAlertView alloc]
                                  initWithTitle:@"Sorry"
                                  message:@"You can't post right now, make sure your device has an internet connection and you have at least one facebook account setup"
                                  delegate:self
                                  cancelButtonTitle:@"OK"
                                  otherButtonTitles:nil];
        [alertView show];
    }
}

-(IBAction)tweetPressed{
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter])
    {
        SLComposeViewController *tweetSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
        [tweetSheet setInitialText:@"Check out this great interview app called @preppdapp!"];
        [self presentViewController:tweetSheet animated:YES completion:nil];
        
    }
    else
    {
        UIAlertView *alertView = [[UIAlertView alloc]
                                  initWithTitle:@"Sorry"
                                  message:@"You can't send a tweet right now, make sure your device has an internet connection and you have at least one Twitter account setup"
                                  delegate:self
                                  cancelButtonTitle:@"OK"
                                  otherButtonTitles:nil];
        [alertView show];
    }
    
}


@end