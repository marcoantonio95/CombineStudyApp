//
//  SecondSampleView.swift
//  CombineStudyApp
//
//  Created by Marco Antonio Oliveira on 02/03/23.
//

import Combine
import SwiftUI

final class SecondSampleViewModel: ObservableObject {
    @Published var image: UIImage = UIImage()

    func loadImage(for urlString: String) {
        guard let url = URL(string: urlString) else { return }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.image = UIImage(data: data) ?? UIImage()
            }
        }
        task.resume()
    }
}

struct SecondSampleView: View {
    var urlString: String = "https://miro.medium.com/max/800/1*KLrw9Oy3qxuBGqrVKXGL_A.png"
    @ObservedObject var viewModel = SecondSampleViewModel()
    @State var image: UIImage = UIImage()

    var body: some View {
            VStack(alignment: .center, spacing: 8.0) {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:100, height:100)
                    .onReceive(viewModel.$image) { image in
                        self.image = image
                    }
                    .onAppear {
                        viewModel.loadImage(for: urlString)
                    }
                Text("Downloaded image!")
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color("background"))
        .navigationTitle("Second Sample")
    }
}

struct SecondSampleView_Previews: PreviewProvider {
    static var previews: some View {
        SecondSampleView()
    }
}
