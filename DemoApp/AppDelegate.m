//
//  AppDelegate.m
//
// Copyright (c) 2014-2015 PEDev-Console
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

#import <PEObjc-Commons/PEUIUtils.h>
#import "AppDelegate.h"
#import "IQKeyboardManager.h"
#import "PDVUtils.h"
#import "PDVScreenGroup.h"
#import "PDVUIWindow.h"
#import "PDVDevConsoleController.h"
#import "UIViewController+PEDevConsole.h"
#import "PDVAuthenticatedLandingController.h"
#import "PDVCreateAccountController.h"
#import "PDVLoginController.h"

@implementation AppDelegate {
  PDVUtils *_pdvUtils;
}

- (BOOL)application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [self setWindow:[[PDVUIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]]];
  _pdvUtils = [[PDVUtils alloc] initWithBaseResourceFolderOfSimulations:@"application-screens"
                                                           screenGroups:[self screenGroups]];
  UIViewController *rootCtrl = [[UIViewController alloc] init];
  [[rootCtrl view] setBackgroundColor:[UIColor lightGrayColor]];
  UILabel *appTitle = [PEUIUtils labelWithKey:@"PEDev-Console\nDemo App"
                                         font:[UIFont systemFontOfSize:30]
                              backgroundColor:[UIColor clearColor]
                                    textColor:[UIColor whiteColor]
                          verticalTextPadding:15];
  UILabel *shakeMessage = [PEUIUtils labelWithKey:@"(shake to show dev console)"
                                             font:[UIFont systemFontOfSize:20]
                                  backgroundColor:[UIColor clearColor]
                                        textColor:[UIColor whiteColor]
                              verticalTextPadding:15];
  [PEUIUtils placeView:appTitle
            inMiddleOf:[rootCtrl view]
         withAlignment:PEUIHorizontalAlignmentTypeCenter
              hpadding:0];
  [PEUIUtils placeView:shakeMessage
                 below:appTitle
                  onto:[rootCtrl view]
         withAlignment:PEUIHorizontalAlignmentTypeCenter
              vpadding:10
              hpadding:0];
  [[self window] setRootViewController:rootCtrl];
  [rootCtrl pdvDevEnable];
  application.applicationSupportsShakeToEdit = YES;
  [[self window] setBackgroundColor:[UIColor whiteColor]];
  [[self window] makeKeyAndVisible];
  return YES;
}

#pragma mark - PDVDevEnabled protocol

- (NSDictionary *)screenNamesForViewControllers {
  
  /*
   * For each application view controller that we want to integrate with PEDev-Console,
   * we create a mapping between the class name of the view controller, and the
   * name of a folder contained within the 'application-screens/' folder.  When the
   * user is currently at one of these screens, does a shake, and taps to view the
   * available PESimu-Select HTTP simulations available, the folder used to load the
   * HTTP simulations is determined by the name in this mapping.
   */
  
  return @{
    NSStringFromClass([PDVCreateAccountController class]) : @"create-account-screen",
    NSStringFromClass([PDVLoginController class]) : @"login-screen",
    NSStringFromClass([PDVAuthenticatedLandingController class]) : @"authenticated-landing-screen"
  };
}

- (PDVUtils *)pdvUtils {
  return _pdvUtils;
}

#pragma mark - Screen groups displayed by the dev console.

- (NSArray *)screenGroups {
  NSArray *unauthenticatedScreens =
    @[ // Create Account screen
       [[PDVScreen alloc] initWithDisplayName:@"Create Account"
                                  description:@"Create Account screen."
                          viewControllerMaker:^{return [[PDVCreateAccountController alloc] init];}],
       // Login screen
       [[PDVScreen alloc] initWithDisplayName:@"Log In"
                                  description:@"Log In screen."
                          viewControllerMaker:^{return [[PDVLoginController alloc] init];}]];
  PDVScreenGroup *unauthenticatedScreenGroup =
    [[PDVScreenGroup alloc] initWithName:@"Unauthenticated Screens"
                                 screens:unauthenticatedScreens];

  NSArray *authenticatedScreens =
    @[ // Authenticated landing screen
       [[PDVScreen alloc] initWithDisplayName:@"Authenticated Landing"
                                 description:@"Authenticated landing screen of pre-existing user with resident auth token."
                         viewControllerMaker:^{return [[PDVAuthenticatedLandingController alloc] init];}]];
  PDVScreenGroup *authenticatedScreenGroup =
    [[PDVScreenGroup alloc] initWithName:@"Authenticated Screens"
                                 screens:authenticatedScreens];
  return @[ unauthenticatedScreenGroup, authenticatedScreenGroup ];
}

@end
