//
//  FilterButton.swift
//  CloningSpotify
//
//  Created by Rodrigo Barbosa Pereira on 19/05/26.
//

import SwiftUI

struct FilterButton: View {
    var buttonLabel: String = ""
    var body: some View {
        Button {
            print("\(buttonLabel) clicado")
        } label: {
            Text(buttonLabel)
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
    }
}

#Preview {
    FilterButton(buttonLabel: "Playlists")
}
