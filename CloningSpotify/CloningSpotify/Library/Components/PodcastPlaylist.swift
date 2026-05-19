//
//  PodcastPlaylist.swift
//  CloningSpotify
//
//  Created by Rodrigo Barbosa Pereira on 18/05/26.
//

import SwiftUI

struct PodcastPlaylist: View {
    var body: some View {
        HStack {
            RoundedRectangle(cornerRadius: 5)
                .fill(.podcastPurple)
                .frame(width: 67, height: 67)
                .overlay(
                    Image(systemName: "bell.fill")
                        .resizable()
                        .frame(width: 20, height: 23)
                        .foregroundStyle(.podcastGreen)
                )
                .padding(.trailing)
            VStack(alignment: .leading) {
                Text("New Episodes")
                    .font(.headline)
                
                HStack {
                    Image(systemName: "pin.fill")
                        .resizable()
                        .foregroundStyle(.podcastGreen)
                        .frame(width: 8, height: 13)
                    
                    Text("Updated 2 days ago")
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
    PodcastPlaylist()
}
