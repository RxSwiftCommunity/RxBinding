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
    
    var text: Observable<String> {
        return Observable.just("Test String")
    }
    
}
