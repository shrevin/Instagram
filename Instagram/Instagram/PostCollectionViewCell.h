//
//  PostCollectionViewCell.h
//  Instagram
//
//  Created by Shreya Vinjamuri on 6/28/22.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "PFImageView.h"


NS_ASSUME_NONNULL_BEGIN

@interface PostCollectionViewCell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet PFImageView *imageView;


@end

NS_ASSUME_NONNULL_END
