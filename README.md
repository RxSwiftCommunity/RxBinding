# RxBinding

[![CI Status](https://img.shields.io/travis/RxSwiftCommunity/RxBinding.svg?style=flat)](https://travis-ci.org/RxSwiftCommunity/RxBinding)
[![Version](https://img.shields.io/cocoapods/v/RxBinding.svg?style=flat)](https://cocoapods.org/pods/RxBinding)
[![License](https://img.shields.io/cocoapods/l/RxBinding.svg?style=flat)](https://cocoapods.org/pods/RxBinding)
[![Platform](https://img.shields.io/cocoapods/p/RxBinding.svg?style=flat)](https://cocoapods.org/pods/RxBinding)
[![swift](https://img.shields.io/badge/swift-5.0-orange.svg)](https://github.com/RxSwiftCommunity/RxBinding/releases)

RxBinding provides `~>`, `<~>` and `~` operators for data binding using RxSwift, to replace the `bind(to:)` and `disposed(by:)` method in RxSwift.

RxBinding is inspired by the following operators.

- The `<->` operator in RxBiBinding (https://github.com/RxSwiftCommunity/RxBiBinding)
- The `<~` operator in ReactiveCocoa (https://github.com/ReactiveCocoa/ReactiveCocoa)

## Documentation

RxBinding is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'RxBinding'
```

With `@_expoerted import`, the operators can be used in the all file of the project.

```Swift
@_exported import RxBinding
```

#### Usage of `~>`

The type of `text` is `Observable<String?>` and the type of `label.rx.text` is `Binder<String?>`.
RxSwfit provides the following method for the one way data binding between them.

```Swift
viewModel.text.bind(to: label.rx.text).disposed(by: disposeBag)
```

With the operators `~>` (`bind(to:)`) and `~` (`disposed(by:)`) in RxBinding, we can bind with the following simple code.

```Swift
viewModel.text ~> label.rx.text ~ disposeBag
```

Bind an observable object to multiple binders.

```Swift
viewModel.text ~> [label1, label2].map { $0.rx.text } ~ disposeBag
```

#### Usage of `<~>`

The type of `text` is `BehaviorRelay<String?>` and the type of `textFeild.rx.text` is `ControlProperty<String?>`.
To apply the two way data binding between them, we need the following code by RxSwift.

```Swift
viewModel.text.bind(to: textFeild.rx.text).disposed(by: disposeBag)
textFeild.rx.text.bind(to: viewModel.text).disposed(by: disposeBag)
```

With the `<~>`, a simple two way bind operator, and `~` (`disposed(by:)`) in RxBinding, we can do the same thing with the following simple code.

```Swift
viewModel.text <~> textFeild.rx.text ~ disposeBag
```

#### Multiple Bindings

RxBinding supports using a single `disposeBag` for multiple binding operators like this:

```Swift
disposeBag ~ [
    viewModel.text <~> textFeild.rx.text,
    viewModel.uppercaseText ~> label.rx.text,
    viewModel.charactersCount ~> [characterCountLabel1, characterCountLabel2].map { $0.rx.text }
]
```
or this:

```Swift
viewModel.text <~> textFeild.rx.text ~
viewModel.uppercaseText ~> label.rx.text ~
viewModel.charactersCount ~> [characterCountLabel1, characterCountLabel2].map { $0.rx.text }
  ~ disposeBag
```

## NEED YOUR HELP

**I am considering how to remove the operator ~ after the Binder or the ControlEvent property.**

```Swift
viewModel.text ~> label.rx.text
```

If anyone has a good idea about this, please contact me here https://github.com/RxSwiftCommunity/RxBinding/issues/1 or create a PR.
Thanks.

The operator `~>` is equal to `bind(to:)`.

```swift 
viewModel.text ~> label.rx.text
``` 
is euqals to
```swift 
viewModel.text.bind(to: label.rx.text)
````

I mean how to combine the method `disposed(by:)` into the operator `~>`.

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Author

lm2343635, lm2343635@126.com

## License

RxBinding is available under the MIT license. See the LICENSE file for more info.
