//
//  SongsListView.swift
//  CloningSpotify
//
//  Created by Débora Cristina Silva Ferreira on 19/05/26.
//

import SwiftUI

struct Song: Identifiable{
    let id = UUID()
    let name: String
    let artist: String
    let image: String
}

struct SongsListView: View {
    @Environment(\.dynamicTypeSize) private var dynamicTypeSize
    
    
    let songs = [Song(name: "Easy", artist: "Troye Sivan", image: "imageSong"), Song(name: "Change with you", artist: "mehro", image: "change"), Song(name: "Nirvana", artist: "sei la", image: "nirvana"), Song(name: "Blue", artist: "deb", image: "blue"), Song(name: "Yellow", artist: "deb", image: "yellow"), Song(name: "Green", artist: "deb", image: "green"), Song(name: "Pink", artist: "deb", image: "pink")]
    
    var body: some View {
        VStack(spacing: 20) {
            ForEach(songs) { song in
                
                if dynamicTypeSize.isAccessibilitySize {
                    VStack(alignment: .leading, spacing: 12) {
                        
                        Image(song.image)
                            .resizable()
                            .frame(width: 100, height: 100)
                        

                        HStack {
                            
                            VStack(alignment: .leading) {
                                Text(song.name)
                                    .foregroundStyle(.white)
                                    .font(.body)
                                    .fontWeight(.semibold)
                                    .accessibilityLabel("Song name")

                                
                                Text(song.artist)
                                    .foregroundStyle(.white)
                                    .font(.subheadline)
                                    .fontWeight(.light)
                                    .accessibilityLabel("Song artist")

                            }
                            .accessibilityElement(children: .combine)
                            
                            .accessibilityLabel("\(song.name) by \(song.artist)")
                         
                            Spacer()
                            
                            Button {
                                
                            }label: {
                                Image(systemName: "ellipsis")
                                    .foregroundStyle(.gray)
                                    .font(.title2)
                            }
                            .accessibilityLabel("More")
    
                            .accessibilityHint("More option about song")
                            
                        }
                      
                    }
                    
                    
                } else {
                    HStack {
                        
                        Image(song.image)
                            .resizable()
                            .frame(width: 50, height: 50)
                        
                        VStack(alignment: .leading) {
                            Text(song.name)
                                .foregroundStyle(.white)
                                .font(.body)
                                .fontWeight(.semibold)
                            
                            Text(song.artist)
                                .foregroundStyle(.white)
                                .font(.subheadline)
                                .fontWeight(.light)
                        }
                        .accessibilityElement(children: .combine)
                        
                        .accessibilityLabel("\(song.name) by \(song.artist)")
                        
                        
                        Spacer()
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "ellipsis")
                                .foregroundStyle(.gray)
                                .font(.title2)
                        }
                        .accessibilityLabel("More")

                        .accessibilityHint("More option about song")
                        
                    }
                }
            }
        }
        .padding(.horizontal, 24)
        .background(Color.background)
        .listStyle(.plain)
        .scrollDisabled(true)
        .background(Color.black)
    }
}

#Preview {
    SongsListView()
}
