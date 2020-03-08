//
//  CredentialProviderViewController.h
//  Strongbox Auto Fill
//
//  Created by Mark on 11/10/2018.
//  Copyright © 2018 Mark McGuill. All rights reserved.
//

#import <AuthenticationServices/AuthenticationServices.h>
#import "StorageProvider.h"
#import "SafeMetaData.h"

API_AVAILABLE(ios(12.0))
@interface CredentialProviderViewController : ASCredentialProviderViewController

- (BOOL)liveAutoFillIsPossibleWithSafe:(SafeMetaData*)safeMetaData;
- (BOOL)autoFillIsPossibleWithSafe:(SafeMetaData*)safeMetaData;

- (NSArray<ASCredentialServiceIdentifier *> *)getCredentialServiceIdentifiers;

- (void)exitWithUserCancelled;
- (void)exitWithCredential:(NSString*)username password:(NSString*)password;

void showWelcomeMessageIfAppropriate(UIViewController *vc);

@end
