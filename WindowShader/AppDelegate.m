//
//  AppDelegate.m
//  WindowShader
//
//  Created by Ju, Jackie on 1/9/14.
//  Copyright (c) 2014 Ju, Jackie. All rights reserved.
//

#import "AppDelegate.h"
#import <Carbon/Carbon.h>
EventHandlerUPP hotKeyFunction;
pascal OSStatus hotKeyHandler(EventHandlerCallRef nextHandler,EventRef theEvent, void *userData)
{
    AppDelegate *obj =  (__bridge AppDelegate *)(userData);
    [obj handleHotKey];
    return noErr;
}
@implementation AppDelegate

- (id) init{
    self = [super init];
    if (self) {
        
        status = 0;
        
        //handler
        hotKeyFunction = NewEventHandlerUPP(hotKeyHandler);
        EventTypeSpec eventType;
        eventType.eventClass = kEventClassKeyboard;
        eventType.eventKind = kEventHotKeyReleased;InstallApplicationEventHandler(hotKeyFunction,1,&eventType,(__bridge void *)self,NULL);
        //hotkey
        UInt32 keyCode = 80; //F19
        EventHotKeyRef theRef = NULL;
        EventHotKeyID keyID;
        keyID.signature = 'FOO '; //arbitrary string
        keyID.id = 1;
        RegisterEventHotKey(kVK_ANSI_M, cmdKey|shiftKey, keyID,GetApplicationEventTarget(),0,&theRef);
    }
    return self;
}
- (void)handleHotKey
{
    if (status == 0){
        [self.window miniaturize:nil];
        status = 1;

    }else{
        [self.window deminiaturize:nil];
        status = 0;

    }
}
- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    _mywindow = [[MyWindow alloc] init];
//    [_mywindow makeMainWindow];
//    self.window = _mywindow;
    [self.window setLevel:NSFloatingWindowLevel];
    self.window.backgroundColor = [NSColor colorWithRed:0 green:0 blue:0 alpha:0.1];
//    [self.window setAlphaValue:0.5];
    [self.window setOpaque:NO];
    [self.window setFrame:CGRectMake(0, 0, 1024, 800) display:TRUE];
    
    
}


@end
