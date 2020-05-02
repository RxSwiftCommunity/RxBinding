//
//  ViewModel.swift
//  RxBinding_Example
//
//  Created by Meng Li on 2019/03/19.
//  Copyright © 2019 MuShare. All rights reserved.
//

import RxSwift
import RxCocoa

class ViewModel {

    let text = BehaviorRelay<String?>(value: nil)

    var uppercaseText: Observable<String?> {
        return text.map {
            guard let text = $0 else {
                return nil
            }
            return text.uppercased()
        }
    }

    var charactersCount: Observable<String?> {
        return text.map {
            guard let text = $0 else {
                return "0"
            }
            return String(text.count)
        }
    }

}
