```
 			                    -- Virtual Traveller --
				                      WIP
	  APP IS IN THE VERY EARLY DEVELOPMENT PROGRESS - AND DOESN'T REPRESENT THE FINAL STATE
```

# Virtual Traveller
![Build](https://github.com/mzdm/virtual_traveller_flutter/workflows/build/badge.svg) [![codecov](https://codecov.io/gh/mzdm/virtual_traveller_flutter/branch/master/graph/badge.svg)](https://codecov.io/gh/mzdm/virtual_traveller_flutter)

Search for flights and deep dive into large offers of travelling destinations. Discover recommended and popular places. Use virtual mode to simulate travelling there immediately and discover interesting information about the destination.

# Getting Started

## Preview
\-

## Running the app
\-

## Idea
I wanted to make a flight searching app with interesting suggestions, fully from the scratch. However, due to the current situation with the pandemic, many countries are restricted for particular citizens and travelling there isn't possible. This app has virtual travelling mode, which simulates the travelling here, displays interesting information about the desired location, including picture, points of interests and etc. There's a possibility to save the locations, so you can check them out later!

Powered by the [Tequila API by kiwi.com](https://partners.kiwi.com/our-solutions/tequila/), which fits best for this use.

## State management 
There's no unique rule on what to choose because it always depends on many criterias. When it came to deciding on which state management approach to use in my case, I was deciding between Provider and bloc library. Bloc library is already dependant on Provider package so it is fairly similar in terms of a dependancy injection (DI) (a single instance of a Cubit or Bloc can be provided to all of the widgets within a subtree). [Read more here about bloc library](https://bloclibrary.dev/#/) and [Provider](https://pub.dev/packages/provider).

The reasons why I decided to use the bloc library in my case were following:
- use of the reactive streams, which goes well together with BLoC pattern
- big-sized app 
- easy and reliable tests via bloc_test library, which is based on Mockito

# App Architecture
Using the bloc library allows us to separate our application into three layers:

- Presentation
- Business Logic
- Data
  - Repository
  - Data Provider
  - Models
  
![bloc](https://bloclibrary.dev/assets/bloc_architecture_full.png)
![cubit](https://bloclibrary.dev/assets/cubit_architecture_full.png)


## TO:DO list:
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
- [x] CI / Github Actions
- [ ] Test coverage milestones
  - [ ] 60%
  - [ ] 80%
  - [ ] 100%

## Powered by these libraries:
- [flutter_bloc](https://pub.dev/packages/flutter_bloc)
- [pedantic]()
- [rx_dart]()

## UI inspirations:
- <https://material.io/design/material-studies/crane.html>
- []()

## Related recommended resources:
- [Great YouTube channel about the BLoC Architecture](https://www.youtube.com/channel/UC5PYcSe3to4mtm3SPCUmjvw)
- [bloc library docs](https://bloclibrary.dev/#/)

## Contribution:
The app is still in the development proccess and isn't sustainable for contributions yet.

~~If you wish to contribute, file an issue with an appropriate tag or propose a PR. If it is a breaking change, please create an issue first.~~
