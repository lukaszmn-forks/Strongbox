//
//  CustomFieldTableCell.m
//  Strongbox-iOS
//
//  Created by Mark on 26/03/2019.
//  Copyright © 2019 Mark McGuill. All rights reserved.
//

#import "CustomFieldTableCell.h"
#import "ColoredStringHelper.h"
#import "Settings.h"

NSString *const CustomFieldCellHeightChanged = @"CustomFieldCellHeightChangedNotification";

@interface CustomFieldTableCell ()

@property (weak, nonatomic) IBOutlet UILabel *keyLabel;
@property (weak, nonatomic) IBOutlet UILabel *valueLabel;
@property (weak, nonatomic) IBOutlet UIButton *buttonShowHide;

@property NSString* _key;
@property NSString* _value;
@property BOOL _hidden;
@property BOOL _showShowHideButton;

@end

@implementation CustomFieldTableCell

- (NSString *)key {
    return self._key;
}

- (void)setKey:(NSString *)key {
    self._key = key;
    self.keyLabel.text = key;
}

- (NSString *)value {
    return self._value;
}

- (void)setValue:(NSString *)value {
    self._value = value;
    self.valueLabel.text = value;
}

- (BOOL)hidden {
    return self._hidden;
}

- (void)setHidden:(BOOL)hidden {
    self._hidden = hidden;
    [self showHide];
}

- (BOOL)isHideable {
    return self._showShowHideButton;
}
- (void)setIsHideable:(BOOL)showShowHideButton {
    self._showShowHideButton = showShowHideButton;
    self.buttonShowHide.hidden = !showShowHideButton;
}

- (IBAction)toggleShowHide:(id)sender {
    self._hidden = !self._hidden;
    [self showHide];
}

- (void)showHide {
    if(self._hidden) {
        [self.buttonShowHide setImage:[UIImage imageNamed:@"show"] forState:UIControlStateNormal];
        self.valueLabel.text = @"*****************";
        self.valueLabel.textColor = [UIColor lightGrayColor];
    }
    else {
        [self.buttonShowHide setImage:[UIImage imageNamed:@"hide"] forState:UIControlStateNormal];

        BOOL dark = NO;
        if (@available(iOS 12.0, *)) {
           dark = self.traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark;
        }
        BOOL colorBlind = Settings.sharedInstance.colorizeUseColorBlindPalette;

        self.valueLabel.attributedText = [ColoredStringHelper getColorizedAttributedString:self._value
                                                                                  colorize:self.colorize
                                                                                  darkMode:dark
                                                                                colorBlind:colorBlind
                                                                                      font:self.valueLabel.font];
    }
        
    [[NSNotificationCenter defaultCenter] postNotificationName:CustomFieldCellHeightChanged object:self];
}

@end
