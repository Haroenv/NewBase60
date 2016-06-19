# NewBase60

[![CI Status](http://img.shields.io/travis/Haroenv/NewBase60.svg?style=flat)](https://travis-ci.org/Haroenv/NewBase60)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Version](https://img.shields.io/cocoapods/v/NewBase60.svg?style=flat)](http://cocoapods.org/pods/NewBase60)


## Usage

```swift
import NumToBase60

NumToBase60.IntToSxg(123)
NumToBase60.IntToSxgF(123123, formatLength: 4)
NumToBase60.SxgToInt("f1ex")
NumToBase60.DateToSxg(NSDate(timeIntervalSinceReferenceDate: 0))
NumToBase60.DateToSxgF(NSDate(timeIntervalSinceReferenceDate: 0), formatLength: 6)
NumToBase60.SxgToDate("38i")
NumToBase60.SxgToISO("37j")
```

## Requirements

- iOS 8.0 and above
- Xcode 7.0 and above

## Installation

### Carthage

NewBase60 is available through [Carthage](https://github.com/carthage/carthage). To install it, simply add the following line to your Cartfile:

```
github "Haroenv/NewBase60"
```

### Cocoapods

NewBase60 is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "NewBase60"
```

## Author

[@Haroenv](https://github.com/Haroenv)

## License

NewBase60 is available under the MIT license. See the [LICENSE](LICENSE) file for more info.
