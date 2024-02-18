# Rick & Morty

## Description
The project fetches a list of characters and displays detailed information.

## Installation
To fetch remote images, I used Swift Package Manager with SDWebImage for SwiftUI. Before running, ensure to fetch SPM libraries. The application deployment target was set to iOS 15.0.

## What did I accomplish?

- The project was written in MVVM architecture.
- I used async/await with actors for API calls.
- Views are written in SwiftUI. I used @ViewBuilder to make the code cleaner.
- I utilized the popular push/pop method for presenting views.
- I successfully implemented dependency injection.

## Comments
Given time constraints, accomplishing every point was quite challenging. I focused on demonstrating most of the fundamental methods in developing the app.
If I had more time, I would make the following changes to the project:
- Introduce character paging. (Currently, we fetch only one page)
- Add the ability to mark characters as favorites and highlight them in the characters list.
