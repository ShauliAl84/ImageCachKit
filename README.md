# Movie List App

## 📌 Overview
Movie List App is a SwiftUI-based iOS application that showcases movies categorized into:
- **Upcoming Movies**
- **Now Playing Movies**
- **Top Rated Movies**

Users can:
- Browse movies by category.
- View detailed information about each movie.
- Add or remove movies from the favorites list.
- Watch trailers for selected movies.

This project is built using **The Composable Architecture (TCA)** to ensure a scalable and maintainable architecture.

---

## 🏗️ Architecture: The Composable Architecture (TCA)
This project follows **TCA**, a powerful state management framework that provides a unidirectional data flow and modular structure.

### **Core Principles of TCA in this App:**
- **State Management**: The entire app state is managed in a single source of truth.
- **Reducers**: Business logic is handled in reducers that define how state updates occur.
- **Actions**: Events in the app trigger actions that mutate the state.
- **Store**: Views observe and interact with the app's state via stores.
- **Navigation with StackState**: The app uses `NavigationStackStore` to manage navigation flows.

### **Feature Modules**
1. **Root Feature**: Manages global navigation and app structure.
2. **Movie List Feature**: Fetches and displays movie categories.
3. **Movie Details Feature**: Shows details and plays trailers.
4. **Favorites Feature**: Stores favorite movies using `@Shared` for state sharing.

---

## 🛠️ Third-Party Dependencies
This project uses the following Swift Package Manager (SPM) dependencies:

| Package | Description |
|---------|-------------|
| [Composable Architecture](https://github.com/pointfreeco/swift-composable-architecture) | State management framework |
| [YouTubePlayerKit](https://github.com/SvenTiigi/YouTubePlayerKit) | Embedded YouTube video playback |

---

## 🎬 Features Breakdown
### **🎥 Movie List Screen**
- Displays three movie categories: **Upcoming, Now Playing, Top Rated**.
- Uses a `Segmented Picker` to navigate between movie categories.
- Allows users to tap a movie to view details.

### **⭐ Favorite Movies**
- Users can add/remove movies from their favorites list.
- The favorite list persists using `@Shared` state in TCA.
- Favorites are stored locally with SwiftData.

### **📜 Movie Details Screen**
- Displays in-depth details of the selected movie.
- Plays the trailer using `YouTubePlayerKit`.
- Allows users to favorite/unfavorite the movie.

---

## 🏗️ Installation & Setup
1. Clone the repository:
   ```sh
   git clone https://github.com/shauli84/MovieListApp.git
   cd MovieListApp
   git checkout NetworkManager
   ```

2. Open the project in Xcode:
   ```sh
   open MovieListApp.xcodeproj
   ```

3. Install dependencies via SPM:
   - Open **Xcode**
   - Navigate to `Project > Package Dependencies`
   - Add required packages

4. Run the app on a simulator or device.

---

## 📌 Future Improvements
- Implement **search functionality** for movies.
- Add **offline caching** for movies and images.
- Enhance **UI/UX animations** with SwiftUI.

---

## 👥 Contributors
- **Shauli Algawi** - Developer & Architect

---

## 📜 License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

