//
//  CustomPlaylist.swift
//  CloningSpotify
//
//  Created by Rodrigo Barbosa Pereira on 18/05/26.
//

import SwiftUI

struct CustomPlaylist: View {
    @ScaledMetric var playlistPicSize: CGFloat = 67

    var body: some View {
        HStack {
            Image("Front Left")
                .resizable()
                .frame(width: playlistPicSize, height: playlistPicSize)
                .padding(.trailing)
            
            VStack(alignment: .leading) {
                Text("Front Left")
                    .lineLimit(1)
                    .foregroundStyle(.white)
                    .font(.headline)
                Text("Playlist • Spotify")
                    .lineLimit(2)
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
    CustomPlaylist()
}
