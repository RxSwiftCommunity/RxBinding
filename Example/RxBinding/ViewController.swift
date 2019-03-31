//
//  ViewController.swift
//  RxBinding
//
//  Created by Meng Li on 03/14/2019.
//  Copyright (c) 2019 MuShare. All rights reserved.
//

import UIKit
import SnapKit
import RxSwift
import RxBinding

class ViewController: UIViewController {
    
    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    private let viewModel: ViewModel
    private let disposeBag = DisposeBag()
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(label)
        createConstraints()
        
        viewModel.text ~> label.rx.text ~ disposeBag
    }
    
    private func createConstraints() {
        label.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
}
