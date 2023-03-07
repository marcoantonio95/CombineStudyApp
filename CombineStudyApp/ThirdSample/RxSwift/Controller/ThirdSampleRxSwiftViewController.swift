//
//  ThirdSampleRxSwiftViewController.swift
//  CombineStudyApp
//
//  Created by Marco Antonio Oliveira on 06/03/23.
//

import UIKit
import SwiftUI
import RxSwift
import RxCocoa

class ThirdSampleRxSwiftViewModel {
    var charactersList: [Character] = []
    
    func fetchCharacters() -> Observable<[Character]> {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else {return .just([])}
        
        return URLSession.shared.rx
            .response(request: .init(url: url))
            .map { [weak self] _, data in
                let decoder = JSONDecoder()
                let decoded = try decoder.decode(CharacterPage.self, from: data)
                for char in decoded.results {
                    self?.charactersList.append(char)
                }
                return self?.charactersList ?? []
            }
            .catchAndReturn([])
    }
    
    func downloadImage(urlImage: String) -> Observable<UIImage?> {
        guard let url = URL(string: urlImage) else { return .just(nil)}
        
        return URLSession.shared.rx
            .response(request: .init(url: url))
            .map { _, data in UIImage(data: data) }
            .catchAndReturn(nil)
    }
}

final class ThirdSampleRxSwiftViewController: UIViewController {
    
    let content = ThirdSampleRxSwiftView()
    let disposeBag = DisposeBag()
    let viewModel = ThirdSampleRxSwiftViewModel()
    
    override func loadView() {
        view = content
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchCharacters().bind(to: self.content.tableView.rx.items(cellIdentifier: "characterCell", cellType: CharacterTableViewCell.self)) {
            row,item,cell in
            cell.nameLabel.text = item.name
            cell.specieLabel.text = item.species
            
            self.viewModel.downloadImage(urlImage: item.image).bind { image in
                DispatchQueue.main.async {
                    cell.photoImageView.image = image
                }
            }.disposed(by: self.disposeBag)
            
        }.disposed(by: disposeBag)
    }
    
}

extension ThirdSampleRxSwiftViewController : UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> ThirdSampleRxSwiftViewController {
        let viewController = ThirdSampleRxSwiftViewController()
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: ThirdSampleRxSwiftViewController, context: Context) {
    }
    
    typealias UIViewControllerType = ThirdSampleRxSwiftViewController
}
