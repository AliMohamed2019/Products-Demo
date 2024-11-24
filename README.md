
# Products Demo App

Welcome to the **Products Demo App**! This application showcases a product listing and details page with features like pagination, dynamic UI updates, image carousel, and smooth navigation.



---



## Table of Contents
1. [Overview](#overview)
2. [Features](#features)
3. [Instructions for Building and Running](#instructions-for-building-and-running)
4. [Assumptions and Decisions](#assumptions-and-decisions)

<br>
<br>


## Overview
The **Products Demo App** is a SwiftUI-based app showcasing modern programming practices:
- **Architecture**: MVVM (Model-View-ViewModel) for separating concerns and enhancing testability.
- **Concurrency**: Swift's **async/await** for handling network calls and state updates.
- **Reusability**: Clean, modular components that can be reused across the app.

<br>
<br>


## Features
- **Product Listing**: Displays a paginated list of products fetched from the API.
- **Product Details**: Showcases product information, including price, discount, and description.
- **Image Carousel**: Product list cells feature an interactive image carousel, allowing users to swipe through product images directly in the list view.
- **Smooth Navigation**: Includes seamless navigation between screens with customized back button behavior.
- **Image Loading with Caching**: Optimized image loading using a network manager with caching.
- **Test Coverage**: Extensive unit tests for core functionalities.
 
<br>
<br>


## Instructions for Building and Running

### Prerequisites
1. **Xcode**: Version 14.0 or later.
2. **macOS**: Version 12.0 or later.

### Steps
1. Clone the repository:
```bash
git clone https://github.com/your-username/products-demo-app.git
cd products-demo-app
```

2. Open the project in Xcode:
```bash
open ProductsDemo.xcodeproj
```

3. Build the project: 
> Use the shortcut Command + B or go to Product > Build in Xcode.

4. Build the project: 
> Use the shortcut Command + R or go to Product > Run.

5. Run tests (optional):
> Use the shortcut Command + U or go to Product > Test to execute the test suite.

<br>
<br>

## Assumptions and Decisions

## Assumptions
- API Structure: The API responses are well-structured and include the necessary data for the product list and details.
- Device Compatibility: The app is designed for iPhone devices and assumes standard screen sizes.
- Network Availability: The app requires an active internet connection to fetch data from the API.

## Decisions
- SwiftUI: Used SwiftUI to demonstrate modern UI design patterns.
- Combine: Leveraged Combine for reactive programming, particularly for handling network calls and state updates.
- Dependency Injection: Injected dependencies (e.g., NetworkManager) to improve testability.


## Thank You!

If you have any questions or suggestions regarding the **Products Demo App** application, please feel free to contact the project maintainer:
- Email: alimohamed2019@gmail.com

<br>
<br>
