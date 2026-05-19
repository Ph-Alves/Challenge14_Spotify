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

    var body: some View {
        VStack(spacing: 2) {
            Image(systemName: imageSymbol)
                .resizable()
                .foregroundStyle(.spotifyGray)
                .frame(width: 20, height: 20)
            
            Text(displayText)
                .foregroundStyle(.spotifyGray)
                .font(.caption2)
                .fontWeight(.regular)
        }
    }
}

#Preview {
    TabItem(imageSymbol: "house", displayText: "Home")
}
