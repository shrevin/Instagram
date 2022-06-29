//
//  ProfileViewController.m
//  Instagram
//
//  Created by Shreya Vinjamuri on 6/28/22.
//

#import "ProfileViewController.h"
#import "PostCollectionViewCell.h"
#import <Parse/Parse.h>
#import "PFImageView.h"
#import "DetailsViewController.h"



@interface ProfileViewController () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (strong, nonatomic) IBOutlet PFImageView *profilePicImage;

@property (strong, nonatomic) IBOutlet UIButton *addProfileButton;
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) PFUser *user;
@property (strong, nonatomic) NSArray *feed;
@property (strong, nonatomic) IBOutlet UILabel *userLabel;
@property (strong, nonatomic) IBOutlet UICollectionViewFlowLayout *flowLayout;

@end

@implementation ProfileViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.profilePicImage.layer.cornerRadius  = self.profilePicImage.frame.size.width/2;
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.user = [PFUser currentUser];
    [self request];
    self.userLabel.text = self.user.username;
    if (self.user[@"imageFile"]) {
        self.profilePicImage.file = self.user[@"imageFile"];
        [self.profilePicImage loadInBackground];
    }
    
   
    //self.profilePicImage.clipsToBounds = YES;
    // Do any additional setup after loading the view.
}

- (void)viewDidLayoutSubviews {
   [super viewDidLayoutSubviews];
    //self.flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
//       self.flowLayout.minimumLineSpacing = 0;
//       self.flowLayout.minimumInteritemSpacing = 0;
//       self.flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 10);

}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    int totalwidth = self.collectionView.bounds.size.width;
    int numberOfCellsPerRow = 3;
    //int oddEven = indexPath.row / numberOfCellsPerRow % 2;
    int dimensions = (CGFloat)(totalwidth / numberOfCellsPerRow) - 10;
    return CGSizeMake(dimensions, dimensions);
//    if (oddEven == 0) {
//        return CGSizeMake(dimensions, dimensions);
//    } else {
//        return CGSizeMake(dimensions, dimensions / 2);
//    }
}

- (IBAction)clickPhoto:(id)sender {
    UIImagePickerController *imagePickerVC = [UIImagePickerController new];
    imagePickerVC.delegate = self;
    imagePickerVC.allowsEditing = YES;
    // The Xcode simulator does not support taking pictures, so let's first check that the camera is indeed supported on the device before trying to present it.
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        imagePickerVC.sourceType = UIImagePickerControllerSourceTypeCamera;
    }
    else {
        NSLog(@"Camera 🚫 available so we will use photo library instead");
        imagePickerVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }

    [self presentViewController:imagePickerVC animated:YES completion:nil];
}
- (IBAction)clickLibrary:(id)sender {
    UIImagePickerController *imagePickerVC = [UIImagePickerController new];
    imagePickerVC.delegate = self;
    imagePickerVC.allowsEditing = YES;
    imagePickerVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;

    [self presentViewController:imagePickerVC animated:YES completion:nil];
}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    // Get the image captured by the UIImagePickerController
    UIImage *originalImage = info[UIImagePickerControllerOriginalImage];
    UIImage *editedImage = info[UIImagePickerControllerEditedImage];

    if (editedImage) {
        self.profilePicImage.image = editedImage;
    } else {
        self.profilePicImage.image = originalImage;
    }
    
    // Do something with the images (based on your use case)
    
    // Dismiss UIImagePickerController to go back to your original view controller
    PFUser *user = [PFUser currentUser];
    NSData *imageData = UIImagePNGRepresentation(self.profilePicImage.image);
    PFFileObject *imageFile = [PFFileObject fileObjectWithName:@"profile.png" data:imageData];
    //PFObject *userPhoto = [PFObject objectWithClassName:@"UserPhoto"];
    user[@"imageFile"] = imageFile;
    [user saveInBackground];
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.feed.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    PostCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"postCollectionCell" forIndexPath:indexPath];
    cell.imageView.file = self.feed[indexPath.row][@"image"];
    [cell.imageView loadInBackground];
    return cell;
}

- (void) request {
    // construct query
    PFQuery *query = [PFQuery queryWithClassName:@"Post"];
    [query whereKey:@"author" equalTo:self.user];
    query.limit = 20;

    // fetch data asynchronously
    [query findObjectsInBackgroundWithBlock:^(NSArray *posts, NSError *error) {
        if (posts != nil) {
            // do something with the array of object returned by the call
            self.feed = posts;
            [self.collectionView reloadData];
        } else {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    UICollectionViewCell *cell = sender;
    NSIndexPath *indexPath = [self.collectionView indexPathForCell:cell];
    DetailsViewController *detailsVC = [segue destinationViewController];
    detailsVC.my_post = self.feed[indexPath.row];
    
}


@end
