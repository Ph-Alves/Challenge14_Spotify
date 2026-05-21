//
//  PodcastPlaylist.swift
//  CloningSpotify
//
//  Created by Rodrigo Barbosa Pereira on 18/05/26.
//

import SwiftUI

struct PodcastPlaylist: View {
    @ScaledMetric var podcastPicSize: CGFloat = 67
    @ScaledMetric var bellIconSize: CGFloat = 20
    @ScaledMetric var pinIconSize: CGFloat = 8

    var body: some View {
        HStack {
            RoundedRectangle(cornerRadius: 5)
                .fill(.podcastPurple)
                .frame(width: podcastPicSize, height: podcastPicSize)
                .overlay(
                    Image(systemName: "bell.fill")
                        .resizable()
                        .frame(width: bellIconSize, height: bellIconSize + 3)
                        .foregroundStyle(.podcastGreen)
                )
                .padding(.trailing)
            VStack(alignment: .leading) {
                Text("New Episodes")
                    .lineLimit(1)
                    .font(.headline)
                
                HStack {
                    Image(systemName: "pin.fill")
                        .resizable()
                        .foregroundStyle(.podcastGreen)
                        .frame(width: pinIconSize, height: pinIconSize + 5)
                        .accessibilityLabel("Pinned item")
                    
                    Text("Updated 2 days ago")
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
    PodcastPlaylist()
}
