# Project 3 - *Instagram*

**Instagram** is a photo sharing app using Parse as its backend.

Time spent: **35** hours spent in total

## User Stories

The following **required** functionality is completed:

- [x] User can sign up to create a new account using Parse authentication
- [x] User can log in and log out of his or her account
- [x] The current signed in user is persisted across app restarts
- [x] User can take a photo, add a caption, and post it to "Instagram"
- [x] User can view the last 20 posts submitted to "Instagram"
- [x] User can pull to refresh the last 20 posts submitted to "Instagram"
- [x] User can tap a post to view post details, including timestamp and caption

The following **optional** features are implemented:

- [x] Run your app on your phone and use the camera to take the photo
- [ ] User can load more posts once he or she reaches the bottom of the feed using infinite scrolling
- [x] Show the username and creation time for each post
- [x] User can use a Tab Bar to switch between a Home Feed tab (all posts) and a Profile tab (only posts published by the current user)
- User Profiles:
  - [x] Allow the logged in user to add a profile photo
  - [ ] Display the profile photo with each post
  - [ ] Tapping on a post's username or profile photo goes to that user's profile page
- [ ] After the user submits a new post, show a progress HUD while the post is being uploaded to Parse
- [ ] User can comment on a post and see all comments for each post in the post details screen
- [ ] User can like a post and see number of likes for each post in the post details screen
- [x] Style the login page to look like the real Instagram login page
- [x] Style the feed to look like the real Instagram feed
- [ ] Implement a custom camera view

The following **additional** features are implemented:

- [ ] List anything else that you can get done to improve the app functionality!

- Adding a way for the user to like and comment on the posts
- Adding a way to message another user

Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1. I would like to explore how to edit objects in the database such as adding to an array.
2. I would like to learn more about how to create a new database object to monitor the number of likes and which user liked what post.

## Video Walkthrough

Here's a walkthrough of implemented user stories:

Some of the Core Features:

<img src=https://github.com/shrevin/Instagram/blob/main/most%20of%20the%20core%20features.gif  width="400" height="800">

Taking a Photo with Phone Camera:

![](https://github.com/shrevin/Instagram/blob/main/taking%20the%20photo.gif)

Logging In and Signing Out:

![](https://github.com/shrevin/Instagram/blob/main/logging%20in%20and%20signing%20out.gif)


GIF created ezgif.

## Credits

List an 3rd party libraries, icons, graphics, or other assets you used in your app.

- [AFNetworking](https://github.com/AFNetworking/AFNetworking) - networking task library

## Notes

Describe any challenges encountered while building the app.

Some challenges I faced included figuring out how to modify the profile picture of the user by adding an image attribute in the database. I also had trouble with the flow layout of the collection view cell and specifying how large the size of the cell should be relative to the width of the screen.

## License

    Copyright [yyyy] [name of copyright owner]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
