//
//  DetailsViewController.h
//  Instagram
//
//  Created by Shreya Vinjamuri on 6/27/22.
//

#import <UIKit/UIKit.h>
#import "Post.h"
#import <Parse/Parse.h>


NS_ASSUME_NONNULL_BEGIN

@interface DetailsViewController : UIViewController
@property (strong, nonatomic) Post *my_post;

@end

NS_ASSUME_NONNULL_END
