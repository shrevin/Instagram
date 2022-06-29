//
//  ComposeViewController.m
//  Instagram
//
//  Created by Shreya Vinjamuri on 6/27/22.
//

#import "ComposeViewController.h"
#import "Post.h"

@interface ComposeViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UITextField *captionField;


@end

@implementation ComposeViewController
- (IBAction)clickCancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)clickShare:(id)sender {
    UIImage *image = self.imageView.image;
    // completion block returns boolean and error object
    UIImage *resized = [self resizeImage:image withSize:CGSizeMake(300, 300)];
    [Post postUserImage:resized withCaption:self.captionField.text withCompletion:^(BOOL succeeded, NSError *error) {
        if (error == nil) {
            NSLog(@"SUCCESSFULLY SAVED IMAGE");
        } else {
            NSLog(@"did not save image");
        }
    }];
    [self dismissViewControllerAnimated:YES completion:nil];
    

}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.captionField.layer setBorderColor:[[[UIColor grayColor] colorWithAlphaComponent:0.5] CGColor]];
    [self.captionField.layer setBorderWidth:0.5];
    self.captionField.layer.cornerRadius = 5;

    
    
}

- (UIImage *)resizeImage:(UIImage *)image withSize:(CGSize)size {
    UIImageView *resizeImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    
    resizeImageView.contentMode = UIViewContentModeScaleAspectFill;
    resizeImageView.image = image;
    
    UIGraphicsBeginImageContext(size);
    [resizeImageView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

- (IBAction)clickLibrary:(id)sender {
    UIImagePickerController *imagePickerVC = [UIImagePickerController new];
    imagePickerVC.delegate = self;
    imagePickerVC.allowsEditing = YES;
    imagePickerVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;

    [self presentViewController:imagePickerVC animated:YES completion:nil];
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

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    // Get the image captured by the UIImagePickerController
    UIImage *originalImage = info[UIImagePickerControllerOriginalImage];
    UIImage *editedImage = info[UIImagePickerControllerEditedImage];

    if (editedImage) {
        self.imageView.image = editedImage;
    } else {
        self.imageView.image = originalImage;
    }
    
    // Do something with the images (based on your use case)
    
    // Dismiss UIImagePickerController to go back to your original view controller
   [self dismissViewControllerAnimated:YES completion:nil];
}




#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([[segue identifier] isEqualToString:@"sharePostSegue"]) {
        NSLog(@"Sharing Post");
    }
    
}


@end
