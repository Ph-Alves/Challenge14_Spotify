//
//  Song.swift
//  CloningSpotify
//
//  Created by Rodrigo Barbosa Pereira on 18/05/26.
//

import SwiftUI

struct Song: View {
    @ScaledMetric var songPicSize: CGFloat = 67
    @ScaledMetric var explicitMarker: CGFloat = 13
    @ScaledMetric(relativeTo: .caption2) var spacing: CGFloat = 8

    var body: some View {
        HStack {
            Image("Les")
                .resizable()
                .frame(width: songPicSize, height: songPicSize)
                .padding(.trailing)

            VStack(alignment: .leading) {
                Text("Les")
                    .lineLimit(1)
                    .font(.headline)
                HStack {
                    RoundedRectangle(cornerRadius: 4)
                        .frame(width: explicitMarker, height: explicitMarker)
                        .overlay(Text("E")
                        .foregroundStyle(.black)
                        .font(.system(size: spacing)))
                        .foregroundStyle(.libraryGray)
                        .accessibilityLabel("Explicit")
                    
                    Text("Song • Childish Gambino")
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
    Song()
}
