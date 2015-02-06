//
//  PDVCreateAccountController.m
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

#import "PDVCreateAccountController.h"
#import <PEObjc-Commons/PEUIUtils.h>
#import "UIViewController+PEDevConsole.h"

@implementation PDVCreateAccountController

- (id)init {
  return [super initWithNibName:nil bundle:nil];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  UILabel *appTitle = [PEUIUtils labelWithKey:@"Create Account\nscreen"
                                         font:[UIFont systemFontOfSize:30]
                              backgroundColor:[UIColor clearColor]
                                    textColor:[UIColor whiteColor]
                        horizontalTextPadding:15
                          verticalTextPadding:15];
  UILabel *shakeMessage = [PEUIUtils labelWithKey:@"(shake to show dev console)"
                                             font:[UIFont systemFontOfSize:20]
                                  backgroundColor:[UIColor clearColor]
                                        textColor:[UIColor whiteColor]
                            horizontalTextPadding:15
                              verticalTextPadding:15];
  [[self view] setBackgroundColor:[UIColor blueColor]];
  [PEUIUtils placeView:appTitle
            inMiddleOf:[self view]
         withAlignment:PEUIHorizontalAlignmentTypeCenter
              hpadding:0];
  [PEUIUtils placeView:shakeMessage
                 below:appTitle
                  onto:[self view]
         withAlignment:PEUIHorizontalAlignmentTypeCenter
              vpadding:10
              hpadding:0];
  
  // enables PEDev-Console integration
  [self pdvDevEnable];
}

@end
