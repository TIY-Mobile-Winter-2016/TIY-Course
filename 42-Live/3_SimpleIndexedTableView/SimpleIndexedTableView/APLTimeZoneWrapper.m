

#import "APLTimeZoneWrapper.h"


@implementation APLTimeZoneWrapper

- (instancetype)initWithTimeZone:(NSTimeZone *)aTimeZone nameComponents:(NSArray *)nameComponents {
	
	self = [super init];
    if (self) {
		
		_timeZone = aTimeZone;
		
		NSString *name = nil;
		if ([nameComponents count] == 2) {
			name = nameComponents[1];
		}
		if ([nameComponents count] == 3) {
			name = [NSString stringWithFormat:@"%@ (%@)", nameComponents[2], nameComponents[1]];
		}
		
		_localeName = [name stringByReplacingOccurrencesOfString:@"_" withString:@" "];
	}
	return self;
}


@end
