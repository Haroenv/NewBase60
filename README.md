# NewBase60

[![CI Status](http://img.shields.io/travis/Haroenv/NewBase60.svg?style=flat-square)](https://travis-ci.org/Haroenv/NewBase60)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat-square)](https://github.com/Carthage/Carthage)
[![Version](https://img.shields.io/cocoapods/v/NewBase60.svg?style=flat-square)](http://cocoapods.org/pods/NewBase60)
[![Carthage compatible](https://img.shields.io/badge/SPM-compatible-ffac45.svg?style=flat-square)](https://github.com/apple/swift-package-manager)

A port of Tantek Çelik's NewBase60 in Swift

## Usage

```swift
import NumToBase60

NumToBase60.IntToSxg(123) // 23
NumToBase60.IntToSxgF(123123, formatLength: 4) // 0_C3
NumToBase60.SxgToInt("f1ex") // 8645997
NumToBase60.DateToSxg(NSDate(timeIntervalSinceReferenceDate: 0)) // 38i
NumToBase60.DateToSxgF(NSDate(timeIntervalSinceReferenceDate: 0), formatLength: 6) // 00038i
NumToBase60.SxgToDate("38i") // 01 Jan 2001 01:00"
NumToBase60.SxgToISO("37j") // 2000-11-03T01:00:00+01:00
```

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

### Swift Package Manager

Add this as a dependency via [Swift Package Manager](https://swift.org/package-manager/) to your `Package.swift`

```swift
let package = Package(
    dependencies: [
        .Package(url: "https://github.com/Haroenv/NewBase60.git", majorVersion: 0),
    ]
)
```

## Author

[@Haroenv](https://github.com/Haroenv)

Note: this is the first Swift Package I created. Help is very welcome

## Thanks

Tantek Çelik's NewBase60.

<http://tantek.com/>

<http://tantek.pbworks.com/NewBase60>

Lightly translated from the original CASSIS to CommonsJS- & Node.js-aware JavaScript by Edward O'Connor <hober0@gmail.com>.

Then translated once more to a more usable Node.js module that implements Date conversion similar to that of Shane Becker's NewBase60 ( <https://github.com/veganstraightedge/new_base_60> ).
NewBase60.js by Michael Owens <mk@mowens.com>. Published on NPM as newbase60 ( <https://npmjs.org/package/newbase60> ).

Translated to Swift by Haroen Viaene on GitHub as <https://github.com/Haroenv/NewBase60>

Released under MIT

## License

NewBase60 is available under the MIT license. See the [LICENSE](LICENSE) file for more info.
