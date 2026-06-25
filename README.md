# tv_shows_app

TV Shows App is a flutter application thought for web that displays a list of TV Shows retrieved from a public API. The user can view the shows in a grid, refresh the data manually, and open a detail screen with more complete information about the selected show.

## Implemented features

- Fetch TV shows from TV Maze. The decision was made based on easy access to the API with no registration required.
- Shows list screen: displays a GridView widget with inside a Card widget.
- Card widget: displays TV show poster image, rating, name
- Detail Screen: contains image, genres, rating, premiere date, status, language, summary and netwrok.
- Loading state management
- Error state management
- Empty state management
- Manual refresh through the AppBar button in ShowsListScreen.
- Centralized custom theme.

## How to run the project

### Requirements
To run the project, Flutter SDK (v. 3.44.3 - latest stable channel dated 25/06/2026) must be installed together with chrome.
An internet connection is also required because the data is retrieved from an external API.

### API keys

Non are required. The project uses the public TVMaze API:
https://api.tvmaze.com/shows

### Main commands

From the project root folder, run:

flutter pub get

Then start the app with:

flutter run -d chrome

## Libraries used

The main libraries used in the project are:

- http: used to perform the GET request to the TVMaze API.
- provider: used to manage the application state in a simple way while keeping it separated from the UI.

## Folder structure

The structure chosen was used to keep the code readable and divided by responsibility.

- main.dart initializes the app and registers the required providers using MultiProvider. MultiProvider was used having in mind the scalability of the project and future provider implementations that could be required to be accessed from the whole app.

- app.dart contains the MaterialApp, the app theme, and the initial screen.

- The models folder contains the classes that represent the data received from the API.

- The services folder contains the logic used to access external data, in this case the HTTP request to the API.

- The providers folder contains the state management logic, separated from the UI.

- The screens folder contains the main screens of the app.

- The widgets folder contains reusable widgets specific to a screen or to the entire app (like the widgets inside folder commons/).

- The theme folder contains the centralized visual theme of the application.

## Main technical choices

### state management with provider

For state management, I chose Provider with ChangeNotifier.

This choice is consistent with the size of the project: the app has one main state related to loading and displaying a list of TV shows, so using a more complex solution would not have been necessary.

### API calls with http

For API calls, I chose the http package.

This choice is suitable for this project because the app only needs to perform a simple GET request to retrieve a list of TV shows from the TVMaze API. Since there is no complex API layer, authentication flow, interceptors, or advanced request configuration, using a more structured library would have added unnecessary complexity.

## Difficulties encountered and solutions adopted

One of the first difficulties was organizing the API request correctly without mixing logic with the UI. The solution was to split the code into service, provider, and screens: the service retrieves the data, the provider manages the state, and the UI displays the result.

The summary returned by the TVMaze API contains HTML tags. To avoid displaying those tags in the detail screen, I added the cleanSummary getter inside the model, which cleans the text before it is shown.

## What I would improve with more time

With more time, I would first improve the handling of missing data from the API. Some fields may be missing or null, so I would make the model even more robust, especially for images and summaries.

I would also improve the grid responsiveness. At the moment, the number of columns is fixed, while a better solution would be to adapt the number of columns based on the screen width using LayoutBuilder or a similar approach.

Another possible improvement would be adding a search feature to filter TV shows by name.

I would also add a favorites screen, saving locally the shows selected by the user.

I would improve error handling by showing more specific messages, for example distinguishing between no internet connection, server error, and invalid response.

These are just some examples of future implementations that could be made, but must not be taken as taxative.
