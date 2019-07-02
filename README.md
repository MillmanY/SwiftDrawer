# SwiftDrawer

[![CI Status](https://img.shields.io/travis/MillmanY/SwiftDrawer.svg?style=flat)](https://travis-ci.org/MillmanY/SwiftDrawer)
[![Version](https://img.shields.io/cocoapods/v/SwiftDrawer.svg?style=flat)](https://cocoapods.org/pods/SwiftDrawer)
[![License](https://img.shields.io/cocoapods/l/SwiftDrawer.svg?style=flat)](https://cocoapods.org/pods/SwiftDrawer)
[![Platform](https://img.shields.io/cocoapods/p/SwiftDrawer.svg?style=flat)](https://cocoapods.org/pods/SwiftDrawer)

## Demo

![list](https://github.com/MillmanY/SwiftDrawer/blob/master/Demo/demo.gif)

## Use
    import SwiftUI
    import SwiftDrawer
    struct ContentView : View {
        var body: some View {
          Drawer()
            .setSlider(view: SliderView(type: .leftRear))
            .setSlider(view: Slider2View(type: .rightFront))
            .setMain(view: HomeView())
        }
    }

## Control
      @EnvironmentObject public var drawerControl: DrawerControl


      public func setSlider<Slider: SliderViewProtocol>(view: Slider,
                                                      widthType: SliderWidth = .percent(rate: 0.6),
                                                      shadowRadius: Length = 10)

      public func setMain<Main: View>(view: Main)
      public func show(type: SliderType, isShow: Bool)
      public func hideAllSlider()
## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

SwiftDrawer is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SwiftDrawer'
```

## Author

MillmanY, millmanyang@gmail.com

## License

SwiftDrawer is available under the MIT license. See the LICENSE file for more info.
