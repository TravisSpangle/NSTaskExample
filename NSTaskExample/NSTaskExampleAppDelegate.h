//
//  NSTaskExampleAppDelegate.h
//  NSTaskExample
//
//  Created by Travis Spangle on 4/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSTaskExampleAppDelegate : NSObject <NSApplicationDelegate> {
@private
    NSWindow *window;
    
    IBOutlet NSTextField *pathToList;
    IBOutlet NSTextField *displayDirectory;
}

@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet NSTextField *pathToList;
@property (assign) IBOutlet NSTextField *displayDirectory;

- (IBAction)getPath:(id)sender;

@end
