
#import "APLAppDelegate.h"
#import "APLViewController.h"

#import "APLTimeZoneWrapper.h"


@implementation APLAppDelegate

- (void)applicationDidFinishLaunching:(UIApplication *)application {

	UINavigationController *navController = (UINavigationController *)self.window.rootViewController;
	APLViewController *rootViewController = (APLViewController *)navController.topViewController;

	/*
	 Create an array of time zone wrappers and pass to the root view controller.
	 */
	NSArray *timeZoneNames = [NSTimeZone knownTimeZoneNames];
	NSMutableArray *timeZones = [[NSMutableArray alloc] initWithCapacity:[timeZoneNames count]];

	for (NSString *timeZoneName in timeZoneNames) {

		NSArray *nameComponents = [timeZoneName componentsSeparatedByString:@"/"];
		// For this example, the time zone itself isn't needed.
		APLTimeZoneWrapper *timeZoneWrapper = [[APLTimeZoneWrapper alloc] initWithTimeZone:nil nameComponents:nameComponents];

		[timeZones addObject:timeZoneWrapper];
	}

	rootViewController.timeZonesArray = timeZones;
}


@end

