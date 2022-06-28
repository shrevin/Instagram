//
//  AppDelegate.m
//  Instagram
//
//  Created by Shreya Vinjamuri on 6/27/22.
//

#import "AppDelegate.h"
#import "Parse/Parse.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    // Parse serves as API and database in one
    // You don't need an API Manager for Parse because it takes care of that for you, you have built in methods and using PF objects you can access info
    ParseClientConfiguration *config = [ParseClientConfiguration  configurationWithBlock:^(id<ParseMutableClientConfiguration> configuration) {

            configuration.applicationId = @"wd9bCHyzNtsysLo6J0nUaiId2CI8EvSMtl39W5i5"; // <- UPDATE
            configuration.clientKey = @"c40gze6APaPohSmPbjXCv0cFQZ9tmcO8JCzosALt"; // <- UPDATE
            configuration.server = @"https://parseapi.back4app.com";
        }];
    [Parse initializeWithConfiguration:config];
    PFObject *my_favs = [PFObject objectWithClassName:@"favorites"];
    my_favs[@"cuisine"] = @"Indian";
    my_favs[@"animal"] = @"giraffe";
    my_favs[@"color"] = @"purple";
    my_favs[@"number"] = @"8";
    [my_favs saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            NSLog(@"Object saved!");
        } else {
            NSLog(@"Error: %@", error.description);
        }
    }];
    
    
    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
