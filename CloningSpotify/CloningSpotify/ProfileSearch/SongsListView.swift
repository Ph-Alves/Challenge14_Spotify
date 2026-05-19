//
//  SongsListView.swift
//  CloningSpotify
//
//  Created by Débora Cristina Silva Ferreira on 19/05/26.
//

import SwiftUI


struct SongsListView: View {
    @Environment(\.dynamicTypeSize) private var dynamicTypeSize
    
    let songs = ["Easy", "Change with you", "Nirvana"]
    
    var body: some View {
        VStack(spacing: 20) {
            
            ForEach(songs, id: \.self) { song in
                
                if dynamicTypeSize.isAccessibilitySize {
                    VStack(alignment: .leading, spacing: 12) {
                        
                        Image("imageSong")
                            .resizable()
                            .frame(width: 100, height: 100)
                        HStack {
                            
                            VStack(alignment: .leading) {
                                Text(song)
                                    .foregroundStyle(.white)
                                    .font(.body)
                                    .fontWeight(.semibold)
                                
                                Text("Troye Sivan")
                                    .foregroundStyle(.white)
                                    .font(.subheadline)
                                    .fontWeight(.light)
                            }
                            
                            Spacer()
                            
                            Image(systemName: "ellipsis")
                                .foregroundStyle(.gray)
                                .font(.title2)
                        }
                    }
                    
                } else {
                    HStack {
                        
                        Image("imageSong")
                            .resizable()
                            .frame(width: 50, height: 50)
                        
                        VStack(alignment: .leading) {
                            Text(song)
                                .foregroundStyle(.white)
                                .font(.body)
                                .fontWeight(.semibold)
                            
                            Text("Troye Sivan")
                                .foregroundStyle(.white)
                                .font(.subheadline)
                                .fontWeight(.light)
                        }
                        
                        Spacer()
                        
                        Image(systemName: "ellipsis")
                            .foregroundStyle(.gray)
                            .font(.title2)
                    }
                }
            }
        }
        .padding()
        .background(Color.black)
        .listStyle(.plain)
        .scrollDisabled(true)
        .background(Color.black)
    }
}

#Preview {
    SongsListView()
}
