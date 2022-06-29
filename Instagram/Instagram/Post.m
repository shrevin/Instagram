//
//  Post.m
//  Instagram
//
//  Created by Shreya Vinjamuri on 6/27/22.
//

#import "Post.h"
#import "Parse/Parse.h"


@implementation Post
    
@dynamic postID;
@dynamic userID;
@dynamic author;
@dynamic caption;
@dynamic image;
@dynamic likeCount;
@dynamic commentCount;

+ (nonnull NSString *)parseClassName {
    return @"Post";
}

+ (void) postUserImage: ( UIImage * _Nullable )image withCaption: ( NSString * _Nullable )caption withCompletion: (PFBooleanResultBlock  _Nullable)completion {
    
    Post *newPost = [Post new];
    //UIImage *resized = [self resizeImage:image withSize:CGSizeMake(300, 300)];
    newPost.image = [self getPFFileFromImage:image];
    //CGSize *size = [CGSize valueWithCGSize:(CGSizeMake(300, 300))];
    //UIImage *resized = [self resizeImage:image withSize:]
    newPost.author = [PFUser currentUser];
    newPost.caption = caption;
    newPost.likeCount = @(0);
    newPost.commentCount = @(0);
    //newPost.createdAt = ;
    
    [newPost saveInBackgroundWithBlock: completion]; // sends this to Parse to save in the database
}

//- (UIImage *)resizeImage:(UIImage *)image withSize:(CGSize)size {
//    UIImageView *resizeImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
//
//    resizeImageView.contentMode = UIViewContentModeScaleAspectFill;
//    resizeImageView.image = image;
//
//    UIGraphicsBeginImageContext(size);
//    [resizeImageView.layer renderInContext:UIGraphicsGetCurrentContext()];
//    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//
//    return newImage;
//}

+ (PFFileObject *)getPFFileFromImage: (UIImage * _Nullable)image {
 
    // check if image is not nil
    if (!image) {
        return nil;
    }
    
    NSData *imageData = UIImagePNGRepresentation(image);
    // get image data and check if that is not nil
    if (!imageData) {
        return nil;
    }
    
    return [PFFileObject fileObjectWithName:@"image.png" data:imageData];
}

@end
