//
//  NSTaskExampleAppDelegate.m
//  NSTaskExample
//
//  Created by Travis Spangle on 4/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "NSTaskExampleAppDelegate.h"

@implementation NSTaskExampleAppDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}

- (IBAction)getPath:(id)sender
{
    NSLog(@"%s\n\tPathValue:%@",__PRETTY_FUNCTION__,[pathToList stringValue]);
    
    [displayDirectory setStringValue:@"See This"];

}

@end
