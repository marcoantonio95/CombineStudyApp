//
//  CharacterRowView.swift
//  CombineStudyApp
//
//  Created by Marco Antonio Oliveira on 02/03/23.
//

import Kingfisher
import SwiftUI

struct CharacterRowView: View {

    let char: Character?

    var body: some View {
        HStack(spacing: 8.0) {
            KFImage(URL(string: char?.image ?? "")!)
              .resizable()
              .frame(width: 50, height: 50)
              .aspectRatio(contentMode: .fit)
              .clipShape(Circle())
            VStack(alignment: .leading) {
                Text(char?.name ?? "")
                .bold()
                Text(char?.species ?? "")
            }
        }
        .padding(.horizontal, 16)
    }
}

struct CharacterRowView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterRowView(char: nil)
    }
}
