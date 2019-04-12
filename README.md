# RxBinding

[![CI Status](https://img.shields.io/travis/RxSwiftCommunity/RxBinding.svg?style=flat)](https://travis-ci.org/RxSwiftCommunity/RxBinding)
[![Version](https://img.shields.io/cocoapods/v/RxBinding.svg?style=flat)](https://cocoapods.org/pods/RxBinding)
[![License](https://img.shields.io/cocoapods/l/RxBinding.svg?style=flat)](https://cocoapods.org/pods/RxBinding)
[![Platform](https://img.shields.io/cocoapods/p/RxBinding.svg?style=flat)](https://cocoapods.org/pods/RxBinding)
[![swift](https://img.shields.io/badge/swift-5.0-orange.svg)](https://github.com/RxSwiftCommunity/RxBinding/releases)

RxBinding provodes '~>', '<~>' and '~' operators for data binding using RxSwift, to replace the `bind(to:)` and `disposed(by:)` method in RxSwift.

RxBinding is inspired by the following operators.

- The `<->` operator in RxBiBinding (https://github.com/RxSwiftCommunity/RxBiBinding)
- The `<~` operator in ReactiveCocoa (https://github.com/ReactiveCocoa/ReactiveCocoa)

## Documentation

RxBinding is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'RxBinding'
```

#### Usage of `~>`

The type of `uppercaseText` is `Observable<String?>` and the type of `label.rx.text` is `Binder<String?>`.
RxSwfit provides the following method for the one way data binding between them.

```Swift
viewModel.uppercaseText.bind(to: label.rx.text).disposed(by: disposeBag)
```

With the `~>`(`bind(to:)`) and `~`(`disposed(by:)`) in RxBinding, we can do the same thing with the following simple code.

```Swift
viewModel.uppercaseText ~> label.rx.text ~ disposeBag
```

#### Usage of `<~>`

The type of `text` is `BehaviorRelay<String?>` and the type of `textFeild.rx.text` is `ControlProperty<String?>`.
To apply the two way data binding between them, we need the following code by RxSwift.

```Swift
viewModel.text.bind(to: textFeild.rx.text).disposed(by: disposeBag)
textFeild.rx.text.bind(to: viewModel.text).disposed(by: disposeBag)
```

With the `<~>`, a simple two way bind operator, and `~`(`disposed(by:)`) in RxBinding, we can do the same thing with the following simple code.

```Swift
viewModel.text <~> textFeild.rx.text ~ disposeBag
```

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Author

lm2343635, lm2343635@126.com

## License

RxBinding is available under the MIT license. See the LICENSE file for more info.
