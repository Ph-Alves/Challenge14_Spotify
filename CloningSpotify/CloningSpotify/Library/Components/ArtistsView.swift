//
//  ArtistsView.swift
//  CloningSpotify
//
//  Created by Rodrigo Barbosa Pereira on 18/05/26.
//

import SwiftUI

struct ArtistsView: View {
    var artistName: String = ""
    @ScaledMetric var artistPicSize: CGFloat = 67
    
    var body: some View {
        HStack {
            Image(artistName)
                .resizable()
                .frame(width: artistPicSize, height: artistPicSize)
                .padding(.trailing)
                .accessibilityLabel("\(artistName) photo")
                .accessibilityHidden(true)
            
            VStack(alignment: .leading) {
                Text(artistName)
                    .lineLimit(1)
                    .font(.headline)
                Text("Artist")
                    .lineLimit(1)
                    .font(.subheadline)
                    .foregroundStyle(.libraryGray)
            }
        }
        .padding(.init(top: 0, leading: 0, bottom: 8, trailing: 0))
        .frame(maxWidth: .infinity, alignment: .leading)
        .accessibilityElement(children: .combine)
        .accessibilityAddTraits(.isButton)
    }
}

#Preview {
    ArtistsView(artistName: "Marvin Gaye")
}
