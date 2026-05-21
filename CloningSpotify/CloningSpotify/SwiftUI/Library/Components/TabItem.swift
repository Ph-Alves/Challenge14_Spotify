//
//  TabItem.swift
//  CloningSpotify
//
//  Created by Rodrigo Barbosa Pereira on 19/05/26.
//

import SwiftUI

struct TabItem: View {
    var imageSymbol: String = ""
    var displayText: String = ""
    @ScaledMetric var tabIconSize: CGFloat = 20

    var body: some View {
        VStack(spacing: 2) {
            Image(systemName: imageSymbol)
                .resizable()
                .foregroundStyle(.spotifyGray)
                .frame(width: tabIconSize, height: tabIconSize)
            
            Text(displayText)
                .lineLimit(1)
                .foregroundStyle(.spotifyGray)
                .font(.caption2)
                .fontWeight(.regular)
        }
        .accessibilityElement(children: .combine)
        .accessibilityAddTraits(.isButton)
    }
}

#Preview {
    TabItem(imageSymbol: "house", displayText: "Home")
}
