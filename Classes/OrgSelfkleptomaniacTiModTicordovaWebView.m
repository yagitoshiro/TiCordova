/**
 * Appcelerator Titanium Mobile
 * Copyright (c) 2009-2012 by Appcelerator, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#import "OrgSelfkleptomaniacTiModTicordovaWebView.h"
#import "TiUtils.h"

@implementation OrgSelfkleptomaniacTiModTicordovaWebView

#pragma mark LIFECYCLE
-(void)willMoveToSuperview:(UIView *)newSuperview
{
	NSLog(@"[VIEW LIFECYCLE EVENT] willMoveToSuperview");
}

-(void)initializeState
{
	// This method is called right after allocating the view and
	// is useful for initializing anything specific to the view
	
	[super initializeState];
	
	NSLog(@"[VIEW LIFECYCLE EVENT] initializeState");
}

-(void)configurationSet
{
	// This method is called right after all view properties have
	// been initialized from the view proxy. If the view is dependent
	// upon any properties being initialized then this is the method
	// to implement the dependent functionality.
	
	[super configurationSet];
	
	NSLog(@"[VIEW LIFECYCLE EVENT] configurationSet");
}

#pragma mark IMPORTANT NOTE

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    BOOL * parentResult = [super webView:webView shouldStartLoadWithRequest:request navigationType:navigationType];
    
    if(!parentResult){
        return NO;
    }else{
        NSURL * newUrl = [request URL];
        NSString * scheme = [[newUrl scheme] lowercaseString];
        NSString * path = [newUrl path];
        if([path hasPrefix:@"/"]){
            path = [path substringWithRange:NSMakeRange(1, path.length - 1)];
        }
        if ([scheme isEqualToString:@"fireevent"])
        {
            NSString * eventName = [newUrl host];
            //NSArray * paths = [path componentsSeparatedByString:@"/"];
            if ([self.proxy _hasListeners:eventName]){
                DebugLog(@"[DEBUG] fire: %@",eventName);
                NSDictionary * event = [NSDictionary dictionaryWithObjectsAndKeys:path, @"path", eventName, @"event", nil];
                [self.proxy fireEvent:eventName withObject:event];
            }

            return NO;
        }
    }
    return YES;
    
}

#pragma mark Cleanup
-(void)dealloc
{
	NSLog(@"[VIEW LIFECYCLE EVENT] dealloc");
	
	[super dealloc];
}

@end
