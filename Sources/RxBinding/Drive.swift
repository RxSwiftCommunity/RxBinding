//
//  Drive.swift
//  RxBinding
//
//  Created by Meng Li on 04/18/2019.
//  Copyright (c) 2019 MuShare. All rights reserved.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import RxSwift
import RxCocoa

infix operator ~> : DefaultPrecedence

// Drive the observer, the relay or the binder.
extension SharedSequenceConvertibleType where SharingStrategy == DriverSharingStrategy {
    
    public static func ~> <O>(observable: Self, observer: O) -> Disposable where O : ObserverType, Element == O.Element {
        return observable.drive(observer)
    }
    
    public static func ~> <O>(observable: Self, observer: O) -> Disposable where O : ObserverType, O.Element == Element? {
        return observable.drive(observer)
    }

    public static func ~> (observable: Self, relay: BehaviorRelay<Self.Element>) -> Disposable {
        return observable.drive(relay)
    }

    public static func ~> (observable: Self, relay: BehaviorRelay<Self.Element?>) -> Disposable {
        return observable.drive(relay)
    }

    public static func ~> <R>(observable: Self, transformation: (Observable<Self.Element>) -> R) -> R {
        return observable.drive(transformation)
    }

}

// Drive the array of observer, relay or binder.
extension SharedSequenceConvertibleType where SharingStrategy == DriverSharingStrategy {
    
    public static func ~> <O>(observable: Self, observers: [O]) -> [Disposable] where O : ObserverType, Element == O.Element {
        return observers.map { observable.drive($0) }
    }
    
    public static func ~> <O>(observable: Self, observers: [O]) -> [Disposable] where O : ObserverType, O.Element == Element? {
        return observers.map { observable.drive($0) }
    }
    
    public static func ~> (observable: Self, relays: [BehaviorRelay<Element>]) -> [Disposable] {
        return relays.map { observable.drive($0) }
    }
    
    public static func ~> (observable: Self, relays: [BehaviorRelay<Element?>]) -> [Disposable] {
        return relays.map { observable.drive($0) }
    }
    
    public static func ~> <R>(observable: Self, transformations: [(Observable<Element>) -> R]) -> [R] {
        return transformations.map { observable.drive($0) }
    }
    
}
