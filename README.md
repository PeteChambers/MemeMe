# MemeMe
An app that enables a user to take a picture, and add text at the top and bottom to form a meme, and share that meme on Facebook and Twitter and also by SMS or email. In this project, sent memes will appear in a tab view with two tabs: a table view and a collection view.

<img width="296" alt="screenshot 2018-10-12 at 16 40 22" src="https://user-images.githubusercontent.com/28652344/46879539-3c507480-ce3e-11e8-936d-e066bb19acd4.png"> <img width="297" alt="screenshot 2018-10-12 at 16 40 39" src="https://user-images.githubusercontent.com/28652344/46879547-407c9200-ce3e-11e8-9dca-f475926b01aa.png"> <img width="296" alt="screenshot 2018-10-12 at 16 44 26" src="https://user-images.githubusercontent.com/28652344/46879553-44101900-ce3e-11e8-9709-4d97207d439a.png">

## Sent Memes View

The sent memes view displays recently sent memes. It has a bottom toolbar with tabs that allow the user to toggle between viewing sent memes in a table and viewing them in a grid. The top navigation bar has a title that reads “Sent Memes” and an add button in the right corner displaying Apple’s stock “Add” icon.

If the user taps the “table” tab on the left of the bottom toolbar, sent memes are displayed in a table. If the user taps on the “collection” tab on the right of the bottom toolbar, sent memes are displayed in a grid. Selecting a meme from the table or collection presents the Meme Detail View. Pressing the “add” button brings up the Meme Editor View


## Meme Editor View

The Meme Editor View consists of an image view overlaid by two text fields, one near the top and one near the bottom of the image. This view has a bottom toolbar with two buttons: one for the camera and one for the photo album. The top navigation bar has a share button on the left displaying Apple’s stock share icon and a “Cancel” button on the right.


## Meme Detail View

The Meme Detail View displays the selected meme in an image view in the center of the page with the meme’s original aspect ratio. The detail view has a back arrow in the top left corner. To the right of the arrow reads the title of the previous view, “Sent Memes.”


## User Flow

When the user first launches the app the Sent Memes View will appear.  The user will be able to view any send memes in either a collection or table view.  Clicking on the plus button in the top right hand corner will launch the Memes Editor View.  In the Meme Editor View, when the user clicks on the “Album” button, an Image Picker is presented, making it possible to choose an image from the Photo Album. If there is a camera available on the device, pressing the camera button launches the camera, and a newly snapped photo can be chosen for the meme. If a camera is not available on the device, the camera button is disabled.

After an image is chosen, the image picker is dismissed, allowing text to be entered into the top and bottom text fields of the editor. When a user clicks inside one of the text fields, the default text disappears and the keyboard slides up. When the user finishes entering text and presses return, the keyboard is dismissed and the new meme is displayed.

When the user presses the “Cancel” button, the Meme Editor View returns to the Sent Memes View.

When the user presses the share button, Apple’s stock Activity View appears, displaying several options for sharing the meme. After an option is chosen, the Activity View is dismissed and the Meme Editor View is visible again.


## Requirements

- Xcode 8.0 or above
- Swift 3 or above
