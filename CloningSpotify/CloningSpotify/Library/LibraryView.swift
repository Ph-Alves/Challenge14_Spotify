//
//  LibraryView.swift
//  CloningSpotify
//
//  Created by Rodrigo Barbosa Pereira on 18/05/26.
//

import SwiftUI

struct LibraryView: View {
    var body: some View {
        
        HStack {
            Image("UserPhoto")
                .resizable()
                .frame(width: 35, height: 35)
                .padding()
            
            Text("Your Library")
                .font(.title2)
                .fontWeight(.semibold)
            
            Spacer()
            
            Image(systemName: "plus")
                .resizable()
                .frame(width: 26, height: 26)
                .foregroundStyle(.spotifyGray)
                .padding(.trailing)
        }
        
        HStack {
            FilterButton(buttonLabel: "Playlists")
            FilterButton(buttonLabel: "Artists")
            FilterButton(buttonLabel: "Albuns")
            FilterButton(buttonLabel: "Podcasts & shows")
        }
        .padding(.init(top: 0, leading: 16, bottom: 16, trailing: 16))
        .frame(maxWidth: .infinity, alignment: .leading)
        
        HStack {
            Image(systemName: "arrow.up.arrow.down")
                .resizable()
                .frame(width: 12, height: 12)
            
            Text("Recently played")
                .font(.caption)
                .fontWeight(.semibold)
            
            Spacer()
            
            Image(systemName: "square.grid.2x2")
        }
        .padding(.init(top: 0, leading: 18, bottom: 16, trailing: 16))

        ScrollView {
            VStack(alignment: .leading) {
                LikedPlaylist()
                PodcastPlaylist()
                ArtistsView(artistName: "Lolo Zouaï")
                ArtistsView(artistName: "Lana Del Rey")
                CustomPlaylist()
                ArtistsView(artistName: "Marvin Gaye")
                Song()
            }
        }
        .padding(.horizontal, 12)
        
        HStack {
            TabItem(imageSymbol: "house",displayText: "Home")
            Spacer()
            TabItem(imageSymbol: "magnifyingglass",displayText: "Search")
            Spacer()
            TabItem(imageSymbol: "books.vertical",displayText: "Library")
        }
        .padding(.init(top: 0, leading: 32, bottom: 0, trailing: 32))
    }
}

#Preview {
    LibraryView()
}
