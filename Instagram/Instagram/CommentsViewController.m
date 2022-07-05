//
//  CommentsViewController.m
//  Instagram
//
//  Created by Shreya Vinjamuri on 6/29/22.
//

#import "CommentsViewController.h"
#import "Parse/Parse.h"
#import "Post.h"
#import "postCell.h"

@interface CommentsViewController ()
@property (strong, nonatomic) IBOutlet UITextView *commentView;

@end

@implementation CommentsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}
// EXTRA FEATURE TO BE COMPLETED
- (IBAction)clickComment:(id)sender {
    //self.my_cell.post.commentsArray.add(self.commentView.text);
    PFObject *p = [PFObject objectWithClassName:@"Post"];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
