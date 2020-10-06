```
 			                    -- Virtual Traveller --
				                      WIP
	  APP IS IN THE VERY EARLY DEVELOPMENT PROGRESS - AND DOESN'T REPRESENT THE FINAL STATE
```

# Virtual Traveller
![Build](https://img.shields.io/badge/Framework-Flutter-blue.svg)&nbsp;&nbsp;&nbsp;&nbsp;![Build](https://github.com/mzdm/virtual_traveller_flutter/workflows/build/badge.svg) [![codecov](https://codecov.io/gh/mzdm/virtual_traveller_flutter/branch/master/graph/badge.svg)](https://codecov.io/gh/mzdm/virtual_traveller_flutter)

Search for flights and deep dive into large offers of travelling destinations. Discover recommended and popular places. Hop on on the virtual mode to simulate travelling immediately to your desired destination and learn more about it, including interesting information and points of interests! 🚀

## Index
- [Previews](https://github.com/mzdm/virtual_traveller_flutter#previews)
- [How to run](https://github.com/mzdm/virtual_traveller_flutter#how-to-run)
- [Idea](https://github.com/mzdm/virtual_traveller_flutter#idea)
- [Visualizing the flow of the app](https://github.com/mzdm/virtual_traveller_flutter#visualizing-the-flow-of-the-app)
- [State management](https://github.com/mzdm/virtual_traveller_flutter#state-management)
- [App Architecture](https://github.com/mzdm/virtual_traveller_flutter#app-architecture)
- [TO:DO list](https://github.com/mzdm/virtual_traveller_flutter#todo-list)
- [Powered by libraries](https://github.com/mzdm/virtual_traveller_flutter#powered-by-these-libraries)
- [UI inspirations](https://github.com/mzdm/virtual_traveller_flutter#ui-inspirations)
- [Related recommended resources](https://github.com/mzdm/virtual_traveller_flutter#related-recommended-resources)
- [Contribution](https://github.com/mzdm/virtual_traveller_flutter#contribution)

## Previews
<p align="left">
<img height="450" width="auto" src="github_images/app_preview_home1.jpg" />
</p>
<p align="left">
<img height="450" width="auto" src="github_images/app_preview_watchlist1.png" />
<img height="450" width="auto" src="github_images/app_preview_watchlist2.png" />
</p>
<p align="left">
<img height="450" width="auto" src="github_images/app_preview_settings1.jpg" />
</p>

## How to run
\-

## Idea
I wanted to make a flight searching app with interesting suggestions, fully from the scratch. However, due to the current situation with the pandemic, many countries are restricted for some citizens so travelling there isn't possible. This app has virtual travelling mode, which simulates the travelling here, displays interesting information about the desired location, including picture, points of interests and etc. There's a possibility to save the locations, so you can check them out later!

Powered by the [Amadeus for Developers API](https://developers.amadeus.com/), which fits best for this use and offers also free monthly quota for testing! Amadeus Travel APIs connect you to the richest information in the travel industry.

## Visualizing the flow of the app
![visualizing the flow of the app](https://github.com/mzdm/virtual_traveller_flutter/blob/master/github_images/visualmap.png)

## App Architecture
Using the bloc library allows us to separate our application into three layers:

- Presentation
- Business Logic
- Data
  - Repository
  - Data Provider
  - Models

<p align="center">
<img height="170" width="auto" src="https://bloclibrary.dev/assets/bloc_architecture_full.png" />
</p>

<p align="center">
<img height="170" width="auto" src="https://bloclibrary.dev/assets/cubit_architecture_full.png" />
</p>

## State management 
There's no unique rule on what to choose because it always depends on many criteria. When it came to deciding on which state management approach to use in my case, I was deciding between Provider and bloc library. Bloc library is already dependant on Provider package so it is fairly similar in terms of a dependency injection (DI) (a single instance of a Cubit or Bloc can be provided to all of the widgets within a subtree). [Read more here about bloc library](https://bloclibrary.dev/#/) and [Provider](https://pub.dev/packages/provider).

The reasons why I decided to use the bloc library in my case were following:
- use of the reactive streams, which goes well together with BLoC pattern
- easy and reliable tests via bloc_test library, which is based on Mockito
- it isn't only a state management library, but it also helps implement the BLoC (Business Logic Component) design pattern

## TO:DO list
### Basics:
- [ ] Features
  - [ ] Splash screen
  - [ ] Intro slider on the first app launch
  - [ ] Discover recommended / popular travelling destinations
  - [ ] Flights searching page
    - [ ] Flight length 
    - [ ] Filter by
      - [ ] Type of the way
        - [ ] One-way
        - [ ] Round Trip
        - [ ] Multicity
      - [ ] Passengers
        - [ ] Kids
        - [ ] Adults
      - [ ] Price
  - [ ] Virtual Mode
    - [ ] Simulate travelling on the map
    - [ ] Display interesting information about the destination
      - [ ] Average temperature past week
      - [ ] Pictures
      - [ ] Points of interests
    - [ ] Save locally to the Favorites
  - [ ] Settings
    - [ ] Default starting location
    - [ ] Language
    - [ ] Currency
    - [ ] Temperature format
    - [ ] Theme
    - [ ] Remove all locally saved data
- [ ] Language Support
  - [x] English
  - [x] Czech
  - [ ] Portuguese
  - [ ] French
  - [ ] German
  - [ ] Russian
- [ ] Supported Platforms
  - [x] Android
  - [x] iOS
  - [ ] Web

### Other:
- [ ] ~~Null safety~~ (not possible yet)
- [x] CI / Github Actions
- [ ] Test coverage milestones
  - [ ] 40%
  - [ ] 60%
  - [ ] 80%

## Powered by these libraries
- #### Common packages:
    - [flutter_bloc](https://pub.dev/packages/flutter_bloc)
    - [rx_dart](https://pub.dev/packages/rxdart)
    - [pedantic](https://pub.dev/packages/pedantic)
    - [bloc_test](https://pub.dev/packages/bloc_test)
    - [mockito](https://pub.dev/packages/mockito)
    - [build_runner](https://pub.dev/packages/build_runner)
    - [json_serializable](https://pub.dev/packages/json_serializable)
    - [freezed](https://pub.dev/packages/freezed)
    - [meta](https://pub.dev/packages/meta)
    - [http](https://pub.dev/packages/http)
    - [equatable](https://pub.dev/packages/equatable)
    - [geolocator](https://pub.dev/packages/geolocator)

- #### UI packages:
    - [flutter_blurhash](https://pub.dev/packages/flutter_blurhash)
    - [intro_slider](https://pub.dev/packages/intro_slider)
    - [responsive_builder](https://pub.dev/packages/responsive_builder)
    - [auto_size_text](https://pub.dev/packages/auto_size_text)
    - [animations](https://pub.dev/packages/animations)

## UI inspirations
- [Material Design - Crane Travel App](https://material.io/design/material-studies/crane.html)
- [Search Flights - Mobile Booking App UI Design by Nitish Khagwal](https://dribbble.com/shots/10749939-Search-Flights-Mobile-Booking-App-UI-Design)
- [Flight Tickets Deal Tracker App | Day 340/365 - Project365 by Kishore](https://dribbble.com/shots/5662956-Flight-Tickets-Deal-Tracker-App-Day-340-365-Project365)

## Related recommended resources
- [Amadeus for Developers API Overview](https://github.com/amadeus4dev/hackathon-starter/blob/master/cheatsheets/amadeus4dev.pdf)
- [Amadeus Self-Service API](https://developers.amadeus.com/self-service)
- [Great YouTube channel about the BLoC Architecture](https://www.youtube.com/channel/UC5PYcSe3to4mtm3SPCUmjvw)
- [bloc library docs](https://bloclibrary.dev/#/)
- [Freezed ❄ – Data Class & Union in One Dart Package - by Reso Coder](https://resocoder.com/2020/02/11/freezed-data-class-union-in-one-dart-package/#t-1600693077177)
- [Flutter Internationalization User Guide](http://flutter.dev/go/i18n-user-guide)

## Contribution
The app is still in the development process and isn't suitable for contributions yet.

~~If you wish to contribute, file an issue with an appropriate tag or propose a PR. If it is a breaking change, please create an issue first.~~
