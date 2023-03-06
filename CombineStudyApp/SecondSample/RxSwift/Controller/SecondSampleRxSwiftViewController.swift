//
//  SecondSampleRxSwiftViewController.swift
//  CombineStudyApp
//
//  Created by Marco Antonio Oliveira on 06/03/23.
//

import UIKit
import SwiftUI
import RxSwift
import RxCocoa

class SecondSampleRxSwiftViewModel {
    var urlString: String = "https://miro.medium.com/max/800/1*KLrw9Oy3qxuBGqrVKXGL_A.png"

    func downloadImage() -> Observable<UIImage?> {
        guard let url = URL(string: urlString) else { return .just(nil)}

        return URLSession.shared.rx
            .response(request: .init(url: url))
            .map { _, data in UIImage(data: data) }
            .catchAndReturn(nil)
    }

}

final class SecondSampleRxSwiftViewController: UIViewController {

    let content = SecondSampleRxSwiftView()
    let disposeBag = DisposeBag()
    let viewModel = SecondSampleRxSwiftViewModel()

    override func loadView() {
        view = content
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.downloadImage().bind(to: content.imageView.rx.image)
            .disposed(by: disposeBag)
    }

}

extension SecondSampleRxSwiftViewController : UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> SecondSampleRxSwiftViewController {
        let viewController = SecondSampleRxSwiftViewController()
        return viewController
    }

    func updateUIViewController(_ uiViewController: SecondSampleRxSwiftViewController, context: Context) {
    }

    typealias UIViewControllerType = SecondSampleRxSwiftViewController
}

