//
//  OneWayBind.swift
//  RxBinding
//
//  Created by Meng Li on 03/30/2019.
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

// Bind to the observer, the relay or the binder.
extension ObservableType {
    
    public static func ~> <O>(observable: Self, observer: O) -> Disposable where O: ObserverType, O.Element == Element {
        return observable.bind(to: observer)
    }
    
    public static func ~> <O>(observable: Self, observer: O) -> Disposable where O : ObserverType, O.Element == Element?  {
        return observable.bind(to: observer)
    }
    
    public static func ~> (observable: Self, relay: PublishRelay<Element>) -> Disposable {
        return observable.bind(to: relay)
    }
    
    public static func ~> (observable: Self, relay: PublishRelay<Element?>) -> Disposable {
        return observable.bind(to: relay)
    }
    
    public static func ~> (observable: Self, relay: BehaviorRelay<Element>) -> Disposable {
        return observable.bind(to: relay)
    }
    
    public static func ~> (observable: Self, relay: BehaviorRelay<Element?>) -> Disposable {
        return observable.bind(to: relay)
    }
    
    public static func ~> <R>(observable: Self, binder: (Self) -> R) -> R {
        return observable.bind(to: binder)
    }
    
    public static func ~> (observable: Self, binder: (Self) -> Disposable) -> Disposable {
        return observable.bind(to: binder)
    }
    
}

// Bind to the array of observer, relay or binder.
extension ObservableType {
    
    public static func ~> <O>(observable: Self, observers: [O]) -> [Disposable] where O: ObserverType, O.Element == Element {
        return observers.map { observable.bind(to: $0) }
    }
    
    public static func ~> <O>(observable: Self, observers: [O]) -> [Disposable] where O : ObserverType, O.Element == Element?  {
        return observers.map { observable.bind(to: $0) }
    }
    
    public static func ~> (observable: Self, relays: [PublishRelay<Element>]) -> [Disposable] {
        return relays.map { observable.bind(to: $0) }
    }
    
    public static func ~> (observable: Self, relays: [PublishRelay<Element?>]) -> [Disposable] {
        return relays.map { observable.bind(to: $0) }
    }
    
    public static func ~> (observable: Self, relays: [BehaviorRelay<Element>]) -> [Disposable] {
        return relays.map { observable.bind(to: $0) }
    }
    
    public static func ~> (observable: Self, relays: [BehaviorRelay<Element?>]) -> [Disposable] {
        return relays.map { observable.bind(to: $0) }
    }
    
    public static func ~> <R>(observable: Self, binders: [(Self) -> R]) -> [R] {
        return binders.map { observable.bind(to: $0) }
    }
    
}


