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
- (IBAction)clickComment:(id)sender {
    //self.my_cell.post.commentsArray.add(self.commentView.text);
    PFObject *p = [PFObject objectWithClassName:@"Post"];
    //ParseQuery<ParseObject> query = ParseQuery.getQuery("Post");
    // Retrieve the object by id
    //query.getInBackground(self.my_cell.post.postID, new GetCallback<ParseObject>() {
//    PFQuery *query = [PFQuery queryWithClassName:@"Post"];
//    [query whereKey:@"objectId" equalTo:self.my_cell.post.postID];
//    [query findObjectsInBackgroundWithBlock:^(NSArray *posts, NSError *error) {
//        if (posts != nil) {
//            // do something with the array of object returned by the call
//            Post *p = posts[0];
//            p[@"commentsArray"].add(self.commentView.text);
//        } else {
//            NSLog(@"%@", error.localizedDescription);
//        }
//    }];
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
