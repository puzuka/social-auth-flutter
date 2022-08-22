# Social Auth Flutter

This repository contains all source code flutter for the project.

-  Language: Dart
-  Flutter: stable 2.10.5
- IDE:  Visual Code / Android Studio
- Deployment target
    -  iOS: `10.0+.`
    - Android: `minSdkVersion 21`
- Device Orientation: Portrail (primary)
- Standard design: iPhone XS (375x812 @3x)
- flavor: n/a (development | production)

# Application Clean Architecture

```
|-----------------  Layers  ------------------|
| Presentations  |  Doamin     |   Data Layer |
|:-------------------------------------------:|

|--------------------------  Actual  ---------------------------|
| Presentations  |        Doamin          |         Data        |
|:-------------------------------------------------------------:|
| View <--> ViewModel <--> UseCase <--> Repository <--> API/Dao |
|:-------------------------------------------------------------:|
|:----       Entity         ----|----       Model      --------:|
|:-------------------------------------------------------------:|
```
![image](https://user-images.githubusercontent.com/13028582/186032061-21c60ce0-da97-45e0-9e2e-15f9f6fc89d2.png)

**Technology stack details**

|                      |                                                                                                                                                                                  |
| -------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| State management     | `flutter_bloc`<br>Flutter Widgets that make it easy to implement the BLoC (Business Logic Component) design pattern. Built to be used with the bloc state management package.         |
| Reactive programming | RxDart is an implementation of the popular reactiveX api for asynchronous programming, leveraging the native Dart Streams api.                                                      |
| Testing Framework    | `mockito`, `bloc_test`<br>A Dart mock library which simplifies mocking with null safety support and no manual mocks or code generation.                                 |
| Networking           | `retrofit`<br>retrofit.dart is an dio client generator using source_gen and inspired by Chopper and Retrofit.                                                                         |
| Dependency injection | `get_it`<br>Simple direct Service Locator that allows to decouple the interface from a concrete implementation and to access the concrete implementation from everywhere in your App” |                  



# Features
 - [x] Get assets multi packages
 - [x] Localize to package
 - [x] Flutter lint
 - [x] Pipeline
 - [x] Storybook isolate dependencies for screen and ui
 - [x] Theme dark mode and light mode
 - [x] Communicate Cross domain (MultiBlocProvicer)
 - [x] Support dependency_injection cross domain use to `app_core/lib/src/core/dependency_injection/di.dart` 
 - [ ] Router for Navigator
  
