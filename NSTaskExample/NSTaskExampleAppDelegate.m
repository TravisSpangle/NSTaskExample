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
    NSLog(@"%s\n\tPath Value:%@",__PRETTY_FUNCTION__,[pathToList stringValue]);
    
    NSTask *lsCommand = [[NSTask alloc] init];
    [lsCommand setLaunchPath:@"/bin/ls"];
    
    NSArray *lsArgs = [NSArray arrayWithObjects: @"-l", @"-a", [pathToList stringValue], nil];
    [lsCommand setArguments:lsArgs];
    
    NSPipe *pipe;
    pipe = [NSPipe pipe];
    [lsCommand setStandardOutput: pipe];
    
    NSFileHandle *file;
    file = [pipe fileHandleForReading];
    

    [lsCommand launch];
    [lsCommand waitUntilExit];
     
    NSData *data;
    data = [file readDataToEndOfFile];
    
    NSString *output;
    output = [[[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding] autorelease];
    
    [displayDirectory setStringValue:output];
    [lsCommand release];
}

@end
