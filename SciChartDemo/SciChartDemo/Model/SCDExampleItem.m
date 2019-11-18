//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2019. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCDExampleItem.m is part of the SCICHART® Examples. Permission is hereby granted
// to modify, create derivative works, distribute and publish any part of this source
// code whether for commercial, private or personal use.
//
// The SCICHART® examples are distributed in the hope that they will be useful, but
// without any warranty. It is provided "AS IS" without warranty of any kind, either
// expressed or implied.
//******************************************************************************

#import "SCDExampleItem.h"

@implementation SCDExampleItem

- (instancetype)initWithName:(NSString *)name description:(NSString *)description exampleIcon:(NSString *)icon fileName:(NSString *)fileName {
    self = [super initWithTitle:name subtitle:description iconImageName:icon andAction:nil];
    if (self) {
        _fileName = fileName;
    }
    return self;
}

@end
