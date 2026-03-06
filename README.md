# SwiftUI API Explorer (MVVM + Combine)

A small SwiftUI project built to **explore API integration using a traditional completion handler approach**, while implementing a **clean MVVM architecture**.

The app fetches posts from the JSONPlaceholder API and displays them in a SwiftUI list.

---

## 🚀 Features

* Fetch data from REST API
* Clean **MVVM architecture**
* **ObservableObject ViewModel**
* State management using **@Published (Combine)**
* Generic API client
* Error handling with alerts
* Loading indicator using `ProgressView`
* Navigation using `NavigationLink`
* Reusable UI components

---

## 🧱 Architecture

This project follows the **MVVM (Model–View–ViewModel)** pattern.

```
SwiftUI View
     ↓
ViewModel (ObservableObject)
     ↓
API Client (Networking Layer)
     ↓
API Endpoint
```

### Components

**Model**

* `Post` model conforming to `Decodable`

**ViewModel**

* `HomeViewModel`
* Uses `ObservableObject`
* Publishes state using `@Published`

**View**

* `HomeView`
* Uses `@StateObject` to observe ViewModel

**Networking**

* `APIClients`
* Generic request function
* Completion handler based API call

---

## 🌐 API Used

This project uses the free testing API:

https://jsonplaceholder.typicode.com

Example endpoint:

```
GET /posts
```

---

## ⚙️ Tech Stack

* Swift
* SwiftUI
* Combine
* URLSession
* MVVM Architecture

---

## 📂 Project Structure

```
APITest
│
├── Models
│   └── Post.swift
│
├── ViewModels
│   └── HomeViewModel.swift
│
├── Networking
│   ├── APIClients.swift
│   └── APIEndpoints.swift
│
├── Views
│   ├── HomeView.swift
│   └── ReuseablePostCards.swift
│
└── APITestApp.swift
```

---

## 📸 UI Flow

1️⃣ App launches
2️⃣ API request starts
3️⃣ `ProgressView` shows loading
4️⃣ Posts load into list
5️⃣ Tap a post → Navigate to details

---

## 📚 Learning Goals

This project was built to practice:

* SwiftUI state management
* Combine `@Published`
* API networking
* Generic networking layer
* Clean MVVM separation
* Navigation in SwiftUI

---

## 🧑‍💻 Author

Built while exploring **SwiftUI networking and architecture patterns**.

---

## ⭐ Future Improvements

* Async/Await networking
* Pagination
* Unit testing
* Dependency injection
* API caching
* Post detail screen

---
