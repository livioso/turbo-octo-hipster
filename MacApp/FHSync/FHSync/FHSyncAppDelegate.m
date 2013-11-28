//
//  FHSyncAppDelegate.m
//  FHSync
//
//  Created by Marius Küng on 26.11.13.
//  Copyright (c) 2013 Marius Küng. All rights reserved.
//

#import "FHSyncAppDelegate.h"

@implementation FHSyncAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    [statusItem setMenu:statusMenu];
    [statusItem setTitle:@"FHSync"];
    [statusItem setHighlightMode:YES];
}


void runSystemCommand(NSString *cmd)
{
    [[NSTask launchedTaskWithLaunchPath:@"/bin/sh"
                              arguments:[NSArray arrayWithObjects:@"-c", cmd, nil]]
     waitUntilExit];
}

- (IBAction)connectVPN:(id)sender{
//    runSystemCommand(@"ruby ~/projects/turbo-octo-hipster/ConnectMe/rVPNMeNow.rb open");
    NSBundle *mainBundle = [NSBundle mainBundle];
    NSString *myFile = [mainBundle pathForResource: @"ConnectMe/rVPNMeNow" ofType: @"rb"];
    NSString *cmd = [NSString stringWithFormat: @"ruby %@ open", myFile];
    runSystemCommand(cmd);
}
- (IBAction)connectAD:(id)sender{
    NSBundle *mainBundle = [NSBundle mainBundle];
    NSString *myFile = [mainBundle pathForResource: @"ConnectMe/rADMeNow" ofType: @"rb"];
    NSString *cmd = [NSString stringWithFormat: @"ruby %@", myFile];
    runSystemCommand(cmd);
}
- (IBAction)syncAD:(id)sender{
    NSBundle *mainBundle = [NSBundle mainBundle];
    NSString *myFile = [mainBundle pathForResource: @"SyncMe/rSyncMeNow" ofType: @"rb"];
    NSString *cmd = [NSString stringWithFormat: @"ruby %@", myFile];
    runSystemCommand(cmd);
}

@end
