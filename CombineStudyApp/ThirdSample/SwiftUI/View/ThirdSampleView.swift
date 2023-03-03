//
//  ThirdSampleView.swift
//  CombineStudyApp
//
//  Created by Marco Antonio Oliveira on 02/03/23.
//

import Combine
import SwiftUI

final class ThirdSampleViewModel: ObservableObject {

    @Published var charactersList: [Character] = []

    var cancellables = Set<AnyCancellable>()

    init() {
        fetchCharacters()
    }

    private func fetchCharacters() {
       guard let url = URL(string: "https://rickandmortyapi.com/api/character") else {return}

        URLSession.shared.dataTaskPublisher(for: url)
            .receive(on: DispatchQueue.main)
            .tryMap(handleOutput)
            .decode(type: CharacterPage.self, decoder: JSONDecoder())
            .sink { (completion) in
            } receiveValue: { [weak self] (characterPage) in
                for char in characterPage.results {
                    self?.charactersList.append(char)
                }
            }
            .store(in: &cancellables)
    }

    private func handleOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard let response = output.response as? HTTPURLResponse,
            response.statusCode >= 200 && response.statusCode
                < 300 else {
                    throw URLError(.badServerResponse)
                }
        return output.data
    }
}

struct ThirdSampleView: View {
    @ObservedObject var viewModel = ThirdSampleViewModel()
    var body: some View {
        List {
            ForEach(viewModel.charactersList) { char in
                CharacterRowView(char: char)
            }
        }.listStyle(.plain)
        .navigationTitle("Third Sample")
    }
}

struct ThirdSampleView_Previews: PreviewProvider {
    static var previews: some View {
        ThirdSampleView()
    }
}
