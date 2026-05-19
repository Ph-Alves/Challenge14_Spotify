//
//  ArtistsView.swift
//  CloningSpotify
//
//  Created by Rodrigo Barbosa Pereira on 18/05/26.
//

import SwiftUI

struct ArtistsView: View {
    var artistName: String = ""
    var body: some View {
        HStack {
            Image(artistName)
                .resizable()
                .frame(width: 67, height: 67)
                .padding(.trailing)
            VStack(alignment: .leading) {
                Text(artistName)
                    .font(.headline)
                Text("Artist")
                    .font(.subheadline)
                    .foregroundStyle(.libraryGray)
            }
        }
        .padding(.init(top: 0, leading: 0, bottom: 8, trailing: 0))
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    ArtistsView(artistName: "Marvin Gaye")
}
