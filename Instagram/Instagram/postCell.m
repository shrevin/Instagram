//
//  postCell.m
//  Instagram
//
//  Created by Shreya Vinjamuri on 6/27/22.
//

#import "postCell.h"
#import "Post.h"

@implementation postCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setPost:(Post *)post {
    _post = post;
    self.imageView.file = post[@"image"];
    self.captionLabel.text = post[@"caption"];
    [self.imageView loadInBackground];
    
}

@end
