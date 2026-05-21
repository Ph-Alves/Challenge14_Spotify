//
//  FilterButton.swift
//  CloningSpotify
//
//  Created by Rodrigo Barbosa Pereira on 19/05/26.
//

import SwiftUI

struct FilterButton: View {
    var buttonLabel: LocalizedStringResource
    
    var body: some View {
        Button {
            print("\(String(localized: buttonLabel)) clicado")
        } label: {
            Text(buttonLabel)
                .lineLimit(2)
                .foregroundStyle(.white)
                .font(.caption)
                .fontWeight(.medium)
                .padding(14)
        }
//        .buttonStyle(.bordered)
        .overlay(
            RoundedRectangle(cornerRadius: 45)
                .stroke(Color.spotifyGray2, lineWidth: 1)
        )
        .buttonBorderShape(.capsule)
        .accessibilityHint("Tap to filter your Library")
    }
}

#Preview {
    FilterButton(buttonLabel: "Playlists")
}
