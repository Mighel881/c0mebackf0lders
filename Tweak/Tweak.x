#import <Cephei/HBPreferences.h>
#import "c0mebackf0lders.h"

BOOL Enabled;

// main tweak code for ios 7.0 - 13.5

%group maintweak
	%hook SBFolder
		-(BOOL)containsIcon:(id)arg1 {
			return YES;
		}

		-(BOOL)shouldRemoveWhenEmpty {
			return NO;
		}

		-(BOOL)isEmpty {
			return NO;
		}
	%end
%end

extern NSString *const HBPreferencesDidChangeNotification;

%ctor {

    preferences = [[HBPreferences alloc] initWithIdentifier:@"com.pixeljellyfish.cbfprefs"];

    [preferences registerBool:&Enabled default:YES forKey:@"Enabled"];

	%init(maintweak);

}

// end of tweak developed by @pixeljellyfish with help from @c0dine
