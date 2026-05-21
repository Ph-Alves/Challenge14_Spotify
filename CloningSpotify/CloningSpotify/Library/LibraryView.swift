//
//  LibraryView.swift
//  CloningSpotify
//
//  Created by Rodrigo Barbosa Pereira on 18/05/26.
//

import SwiftUI

struct LibraryView: View {
    @ScaledMetric var commonScaleSize: CGFloat = 26

    var body: some View {
        VStack {
            VStack {
                HStack {
                    Image("UserPhoto")
                        .resizable()
                        .frame(width: commonScaleSize + 10, height: commonScaleSize + 10)
                        .padding()
                        .accessibilityLabel("User Profile")
                        .accessibilityAddTraits(.isButton)
                    
                    Text("Your Library")
                        .lineLimit(1)
                        .foregroundStyle(.white)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .accessibilityAddTraits(.isHeader)
                    
                    Spacer()
                    
                    Image(systemName: "plus")
                        .resizable()
                        .frame(width: commonScaleSize, height: commonScaleSize)
                        .foregroundStyle(.spotifyGray)
                        .padding(.trailing)
                        .accessibilityLabel("Create")
                        .accessibilityAddTraits(.isButton)
                }
                
                HStack {
                    FilterButton(buttonLabel: "Playlists")
                    FilterButton(buttonLabel: "Artists")
                    FilterButton(buttonLabel: "Albuns")
                    FilterButton(buttonLabel: "Podcasts & shows")
                }
                .padding(.init(top: 0, leading: 16, bottom: 16, trailing: 16))
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            ScrollView {
                HStack {
                    Image(systemName: "arrow.up.arrow.down")
                        .resizable()
                        .frame(width: commonScaleSize / 1.50, height: commonScaleSize / 1.50)
                        .accessibilityLabel("Sort by")
                        .accessibilityAddTraits(.isButton)
                    
                    Text("Recently played")
                        .lineLimit(1)
                        .font(.caption)
                        .fontWeight(.semibold)
                        .accessibilityAddTraits(.isHeader)
                    
                    Spacer()
                    
                    Image(systemName: "square.grid.2x2")
                        .resizable()
                        .frame(width: commonScaleSize / 1.50, height: commonScaleSize / 1.50)
                        .accessibilityLabel("Change view format")
                        .accessibilityAddTraits(.isButton)

                }
                .foregroundStyle(.white)
                .padding(.init(top: 0, leading: 18, bottom: 16, trailing: 16))

                VStack(alignment: .leading) {
                    LikedPlaylist()
                    PodcastPlaylist()
                    ArtistsView(artistName: "Lolo Zouaï")
                    ArtistsView(artistName: "Lana Del Rey")
                    CustomPlaylist()
                    ArtistsView(artistName: "Marvin Gaye")
                    LibrarySong()
                }
            }
            .scrollIndicators(.hidden)
            .padding(.horizontal, 12)
            
            
    //        HStack {
    //            TabItem(imageSymbol: "house",displayText: "Home")
    ////                .accessibilityLabel("Home button")
    //            Spacer()
    //            TabItem(imageSymbol: "magnifyingglass",displayText: "Search")
    ////                .accessibilityLabel("Search button")
    //            Spacer()
    //            TabItem(imageSymbol: "books.vertical",displayText: "Library")
    ////                .accessibilityLabel("Library button")
    //        }
    //        .padding(.init(top: 0, leading: 32, bottom: 0, trailing: 32))

        }
        .background(Color.background, ignoresSafeAreaEdges: .all)
        .preferredColorScheme(.dark)
    }
}

#Preview {
    LibraryView()
}
