//
//  FirstSampleRxSwiftViewController.swift
//  CombineStudyApp
//
//  Created by Marco Antonio Oliveira on 03/03/23.
//

import UIKit
import SwiftUI
import RxSwift
import RxCocoa

final class FirstSampleRxSwiftViewController: UIViewController {

    let contentView = FirstSampleRxSwiftView()
    let disposeBag = DisposeBag()

    override func loadView() {
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        listenSendButton()
    }

    func listenSendButton() {
        contentView.resultButton.rx.tap.subscribe { [weak self] text in
            self?.contentView.resultLabel.text = self?.contentView.resultTextfield.text
        }.disposed(by: disposeBag)
    }
}

extension FirstSampleRxSwiftViewController: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> FirstSampleRxSwiftViewController {
        let viewController = FirstSampleRxSwiftViewController()
        return viewController
    }

    func updateUIViewController(_ uiViewController: FirstSampleRxSwiftViewController, context: Context) {
    }

    typealias UIViewControllerType = FirstSampleRxSwiftViewController
}
