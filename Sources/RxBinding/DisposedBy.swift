//
//  DisposedBy.swift
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

precedencegroup DisposePrecedence {
    associativity: left
    
    lowerThan: DefaultPrecedence
}

infix operator ~ : DisposePrecedence

extension DisposeBag {
    
    public static func ~ (disposable: Disposable, disposeBag: DisposeBag) {
        disposable.disposed(by: disposeBag)
    }
    
    @discardableResult
    public static func ~ (disposeBag: DisposeBag, disposable: Disposable) -> DisposeBag {
        disposable.disposed(by: disposeBag)
        return disposeBag
    }
    
    public static func ~ (disposeBag: DisposeBag, disposables: [Any]) {
        disposables.map { obj -> [Disposable] in
            switch obj.self {
            case is Disposable:
                return [obj as! Disposable]
            case is [Disposable]:
                return obj as! [Disposable]
            default:
                return []
            }
        }.reduce([]) { $0 + $1 }.forEach {
            print($0)
            $0.disposed(by: disposeBag)
        }
    }
    
    public static func ~ (disposables: [Any], disposeBag: DisposeBag) {
        disposeBag ~ disposables
    }
    
}

extension Array where Element == Disposable {
    
    public static func ~ (disposables: Array, disposeBag: DisposeBag) {
        disposables.forEach { $0.disposed(by: disposeBag) }
    }
    
    public static func ~ (disposeBag: DisposeBag, disposables: Array) {
        disposables.forEach { $0.disposed(by: disposeBag) }
    }
    
    public static func ~ (disposables: Array, disposable: Disposable) -> [Disposable] {
        return disposables + [disposable]
    }
    
    public static func ~ (disposables1: Array, disposables2: Array) -> [Disposable] {
        return disposables1 + disposables2
    }
    
}

public func ~ (disposable1: Disposable, disposable2: Disposable) -> [Disposable] {
    return Array(arrayLiteral: disposable1, disposable2)
}
