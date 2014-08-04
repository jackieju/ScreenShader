//
//  AppDelegate.h
//  WindowShader
//
//  Created by Ju, Jackie on 1/9/14.
//  Copyright (c) 2014 Ju, Jackie. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "MyWindow.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>{
    NSWindow *_mywindow;
    int status;
}

@property (assign) IBOutlet NSWindow *window;

- (void)handleHotKey;


@end
