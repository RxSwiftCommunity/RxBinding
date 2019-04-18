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
    
    private let textFeild: UITextField = {
        let textField = UITextField()
        textField.textAlignment = .center
        textField.placeholder = "Input text here."
        textField.backgroundColor = UIColor(white: 0.9, alpha: 1)
        textField.layer.cornerRadius = 5
        textField.layer.masksToBounds = true
        textField.becomeFirstResponder()
        return textField
    }()
    
    private let label = UILabel()
    
    private let characterCountLabel1 = UILabel()
    private let characterCountLabel2 = UILabel()
    
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
        view.addSubview(textFeild)
        view.addSubview(label)
        view.addSubview(characterCountLabel1)
        view.addSubview(characterCountLabel2)
        createConstraints()
        
        viewModel.text <~> textFeild.rx.text ~ disposeBag
        viewModel.uppercaseText ~> label.rx.text ~ disposeBag
        viewModel.charactersCount ~> [characterCountLabel1, characterCountLabel2].map { $0.rx.text } ~ disposeBag

        /** The demo to use the ~> operator for drivers.
        viewModel.uppercaseText.asDriver(onErrorJustReturn: "") ~> label.rx.text ~ disposeBag
        viewModel.charactersCount.asDriver(onErrorJustReturn: "0") ~> [characterCountLabel1, characterCountLabel2].map { $0.rx.text } ~ disposeBag
        */
    }
    
    private func createConstraints() {
        
        textFeild.snp.makeConstraints {
            $0.left.equalToSuperview().offset(15)
            $0.right.equalToSuperview().offset(-15)
            $0.top.equalToSuperview().offset(60)
            $0.height.equalTo(50)
        }
        
        label.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(textFeild.snp.bottom).offset(10)
        }
        
        characterCountLabel1.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(label.snp.bottom).offset(10)
        }
        
        characterCountLabel2.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(characterCountLabel1.snp.bottom).offset(10)
        }

    }
    
}
