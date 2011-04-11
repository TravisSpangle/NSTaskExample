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
    
    //setting the command to be run from the /bin/ls directory
    NSTask *lsCommand = [[NSTask alloc] init];
    [lsCommand setLaunchPath:@"/bin/ls"];
    
    //command arguments ls -la [path]
    NSArray *lsArgs = [NSArray arrayWithObjects: @"-l", @"-a", [pathToList stringValue], nil];
    [lsCommand setArguments:lsArgs];
    
    //creating pipe object and file handle to collect command outoput 
    NSPipe *pipe;
    pipe = [NSPipe pipe];
    [lsCommand setStandardOutput: pipe];
    
    NSFileHandle *file;
    file = [pipe fileHandleForReading];
    
    //Run command
    [lsCommand launch];
    [lsCommand waitUntilExit];

    //collect output
    NSString *output;
    output = [[[NSString alloc] initWithData: [file readDataToEndOfFile] encoding: NSUTF8StringEncoding] autorelease];
    
    //display on text field
    [displayDirectory setStringValue:output];
    [lsCommand release];
}

@end
