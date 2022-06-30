//
//  HomeViewController.m
//  Instagram
//
//  Created by Shreya Vinjamuri on 6/27/22.
//

#import "HomeViewController.h"
#import "Parse/Parse.h"
#import "LoginViewController.h"
#import "SceneDelegate.h"
#import "postCell.h"
#import "DetailsViewController.h"
#import "Post.h"
#import "DateTools.h"
#import "CommentsViewController.h"

@interface HomeViewController () <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) NSArray *postsArray;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) UIRefreshControl *refreshControl;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self request];
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(request) forControlEvents:UIControlEventValueChanged];
    [self.tableView insertSubview:self.refreshControl atIndex:0];
    // Do any additional setup after loading the view.
    [self.tableView registerClass:[UITableViewHeaderFooterView class] forHeaderFooterViewReuseIdentifier:@"my_footer"];
    [self.tableView registerClass:[UITableViewHeaderFooterView class] forHeaderFooterViewReuseIdentifier:@"my_header"];

    
}

- (void) request {
    PFQuery *query = [PFQuery queryWithClassName:@"Post"];
    [query includeKey:@"author"];
    [query orderByDescending:@"createdAt"];
    query.limit = 20;

    // fetch data asynchronously
    [query findObjectsInBackgroundWithBlock:^(NSArray *posts, NSError *error) {
        if (posts != nil) {
            // do something with the array of object returned by the call
            self.postsArray = posts;
            [self.tableView reloadData];
            [self.refreshControl endRefreshing];
        } else {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
}

- (IBAction)clickLogout:(id)sender {
    [PFUser logOutInBackgroundWithBlock:^(NSError * _Nullable error) {
        // PFUser.current() will now be nil
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        LoginViewController *loginVC = [storyboard instantiateViewControllerWithIdentifier:@"loginVC"];
        self.view.window.rootViewController = loginVC; // resetting root view controlelr
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.postsArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    postCell *cell = [tableView dequeueReusableCellWithIdentifier:@"post"];
    cell.post = self.postsArray[indexPath.section];
//    cell.captionLabel.text = self.postsArray[indexPath.row][@"caption"];
//    cell.imageView.file = self.postsArray[indexPath.row][@"image"];
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UITableViewHeaderFooterView *footer = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"my_footer"];
    Post *post = self.postsArray[section];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"MMM d, yyyy"];
    //NSString *date = [dateFormat stringFromDate:post.createdAt];
    //NSString *date = [NSString stringWithFormat:@"%@", dte];
    footer.textLabel.text = [[post.createdAt shortTimeAgoSinceNow] stringByAppendingString:@" ago"];
    footer.textLabel.font = [UIFont systemFontOfSize:10.0];
    return footer;
}



- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UITableViewHeaderFooterView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"my_header"];
    Post *post = self.postsArray[section];
    PFUser *user = post.author;
    header.textLabel.text = user.username;
    header.textLabel.textColor = [UIColor blackColor];
    [header.textLabel setFont:[UIFont boldSystemFontOfSize:16]];
    return header;
}





#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqual:@"post"]) {
        postCell *cell = sender;
        NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
        DetailsViewController *detailsVC = [segue destinationViewController];
        detailsVC.my_post = self.postsArray[indexPath.section];
        //detailsVC.my_post = cell.post;
    } else if ([segue.identifier isEqual:@"comment"]) {
        CommentsViewController *commentVC = [segue destinationViewController];
        UIView *contentView = (UIView *)[(UIView *)sender superview];
        postCell *cell = (postCell *)[contentView superview];
        commentVC.my_cell = cell;
    }
}


@end
