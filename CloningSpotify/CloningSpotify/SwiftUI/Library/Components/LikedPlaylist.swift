//
//  LikedPlaylist.swift
//  CloningSpotify
//
//  Created by Rodrigo Barbosa Pereira on 18/05/26.
//

import SwiftUI

struct LikedPlaylist: View {
    @ScaledMetric var playlistPicSize: CGFloat = 67
    @ScaledMetric var bellIconSize: CGFloat = 20
    @ScaledMetric var pinIconSize: CGFloat = 8

    var body: some View {
        HStack {
            Rectangle()
                .fill(
                    LinearGradient(colors: [.likedLightGray, .intermediaryLikedBlue, .likedBlue], startPoint: .bottomTrailing, endPoint: .topLeading)
                )
                .frame(width: playlistPicSize, height: playlistPicSize)
                .overlay(
                    Image(systemName: "heart.fill")
                        .resizable()
                        .frame(width: bellIconSize, height: bellIconSize)
                        .foregroundStyle(.white)
                )
                .padding(.trailing)
            VStack(alignment: .leading) {
                Text("Liked Songs")
                    .lineLimit(1)
                    .foregroundStyle(.white)
                    .font(.headline)
                
                HStack {
                    Image(systemName: "pin.fill")
                        .resizable()
                        .foregroundStyle(.podcastGreen)
                        .frame(width: pinIconSize, height: pinIconSize + 5)
                        .accessibilityLabel("Pinned item")
                    
                    Text("Playlist • 58 songs")
                        .lineLimit(2)
                        .font(.subheadline)
                        .foregroundStyle(.libraryGray)
                }
            }
        }
        .padding(.init(top: 0, leading: 0, bottom: 8, trailing: 0))
        .frame(maxWidth: .infinity, alignment: .leading)
        .accessibilityElement(children: .combine)
        .accessibilityAddTraits(.isButton)
    }
}

#Preview {
    LikedPlaylist()
}
