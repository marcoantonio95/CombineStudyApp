//
//  FirstSampleView.swift
//  CombineStudyApp
//
//  Created by Marco Antonio Oliveira on 01/03/23.
//

import Combine
import Foundation
import SwiftUI

final class FirstSampleViewModel: ObservableObject {
    @Published var savedText: String = ""
}

struct FirstSampleView: View {
    @State var text: String = ""
    @ObservedObject private var viewModel = FirstSampleViewModel()

    var body: some View {
        VStack {
            VStack {
                RoundedRectangle(
                    cornerSize: CGSize.init(width: 40, height: 40))
                    .fill(Color("neutralColor"))
                    .frame(height: 180.0, alignment: .center)
                    .overlay(
                        VStack {
                            Text(viewModel.savedText)
                            VStack(spacing: 16) {
                            TextField("Type something...", text: $text).padding(12)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 16)
                                        .stroke(Color("primaryColor"), lineWidth: 3)
                                )
                            Button("Send!", action: {
                                viewModel.savedText = text
                            })
                                .padding()
                                .frame(width: 140, height: 40, alignment: .center)
                                .foregroundColor(.white)
                                .background(Color("primaryColor"))
                                .clipShape(Capsule()
                                )
                            }
                        }
                            .padding(.all, 8)
                    )
                    .padding(.horizontal, 16)
            }
            .navigationTitle("First Sample")

        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("background"))
    }
}

struct FirstSampleView_Previews: PreviewProvider {
    static var previews: some View {
        FirstSampleView()
    }
}
