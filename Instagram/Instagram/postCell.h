//
//  postCell.h
//  Instagram
//
//  Created by Shreya Vinjamuri on 6/27/22.
//

#import <UIKit/UIKit.h>
#import "Parse/Parse.h"
#import "PFImageView.h"

NS_ASSUME_NONNULL_BEGIN

@interface postCell : UITableViewCell
@property (strong, nonatomic) IBOutlet PFImageView *imageView;
@property (strong, nonatomic) IBOutlet UILabel *captionLabel;

@end

NS_ASSUME_NONNULL_END
