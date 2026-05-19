//
//  CustomPlaylist.swift
//  CloningSpotify
//
//  Created by Rodrigo Barbosa Pereira on 18/05/26.
//

import SwiftUI

struct CustomPlaylist: View {
    var body: some View {
        HStack {
            Image("Front Left")
                .resizable()
                .frame(width: 67, height: 67)
                .padding(.trailing)
            VStack(alignment: .leading) {
                Text("Front Left")
                    .font(.headline)
                Text("Playlist • Spotify")
                    .font(.subheadline)
                    .foregroundStyle(.libraryGray)
            }
        }
        .padding(.init(top: 0, leading: 0, bottom: 8, trailing: 0))
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    CustomPlaylist()
}
