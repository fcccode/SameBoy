#import "GBColorCell.h"

static inline double scale_channel(uint8_t x)
{
    x &= 0x1f;
    return x / 31.0;
}

@implementation GBColorCell
{
    NSInteger _integerValue;
}

- (void)setObjectValue:(id)objectValue
{
    _integerValue = [objectValue integerValue];
    super.objectValue = [NSString stringWithFormat:@"$%04x", (uint16_t)(_integerValue & 0x7FFF)];
}

- (NSInteger)integerValue
{
    return _integerValue;
}

- (int)intValue
{
    return (int)_integerValue;
}


- (NSColor *) backgroundColor
{
    uint16_t color = self.integerValue;
    return [NSColor colorWithRed:scale_channel(color) green:scale_channel(color >> 5) blue:scale_channel(color >> 10) alpha:1.0];
}

- (BOOL)drawsBackground
{
    return YES;
}

@end
