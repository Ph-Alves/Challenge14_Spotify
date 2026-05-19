//
//  LikedPlaylist.swift
//  CloningSpotify
//
//  Created by Rodrigo Barbosa Pereira on 18/05/26.
//

import SwiftUI

struct LikedPlaylist: View {
    var body: some View {
        HStack {
            Rectangle()
                .fill(
                    LinearGradient(colors: [.likedLightGray, .intermediaryLikedBlue, .likedBlue], startPoint: .bottomTrailing, endPoint: .topLeading)
                )
                .frame(width: 67, height: 67)
                .overlay(
                    Image(systemName: "heart.fill")
                        .resizable()
                        .frame(width: 21, height: 19)
                )
                .padding(.trailing)
            VStack(alignment: .leading) {
                Text("Liked Songs")
                    .font(.headline)
                
                HStack {
                    Image(systemName: "pin.fill")
                        .resizable()
                        .foregroundStyle(.podcastGreen)
                        .frame(width: 8, height: 13)
                    
                    Text("Playlist • 58 songs")
                        .font(.subheadline)
                        .foregroundStyle(.libraryGray)
                }
            }
        }
        .padding(.init(top: 0, leading: 0, bottom: 8, trailing: 0))
        .frame(maxWidth: .infinity, alignment: .leading)

    }
}

#Preview {
    LikedPlaylist()
}
