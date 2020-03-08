//
//  ClickableSecureTextField.m
//  Strongbox
//
//  Created by Mark on 06/03/2020.
//  Copyright © 2020 Mark McGuill. All rights reserved.
//

#import "ClickableSecureTextField.h"

@implementation ClickableSecureTextField

- (void)mouseDown:(NSEvent *)event {
//    NSLog(@"mouseDown"); 
}

- (void)mouseUp:(NSEvent *)event {
//    NSLog(@"mouseUp");
    
    if(self.onClick) {
        self.onClick();
    }
}

@end
