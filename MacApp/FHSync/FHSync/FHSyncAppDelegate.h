//
//  FHSyncAppDelegate.h
//  FHSync
//
//  Created by Marius Küng on 26.11.13.
//  Copyright (c) 2013 Marius Küng. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface FHSyncAppDelegate : NSObject <NSApplicationDelegate> {

    IBOutlet NSMenu *statusMenu;
    NSStatusItem * statusItem;
    NSImage *statusImage;
    NSImage *statusHighlightImage;
}

//optional
- (IBAction)connectVPN:(id)sender;
- (IBAction)connectAD:(id)sender;
- (IBAction)syncAD:(id)sender;

@property (assign) IBOutlet NSWindow *window;

@end