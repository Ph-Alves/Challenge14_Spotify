//
//  SongPlayingView.swift
//  CloningSpotify
//
//  Created by Débora Cristina Silva Ferreira on 20/05/26.
//

import Foundation
import SwiftUI

struct SongPlayingView: View {
    let songPlaying = Song(name: "Easy", artist: "Troye Sivan", image: "imageSong")
    
    
    var body: some View {
        ViewThatFits(in: .horizontal){

        HStack {
                
                Image("imageSong")
                .accessibilityHidden(true)
            
                VStack(alignment: .leading, spacing: 1) {
                    HStack(alignment: .center, spacing: 10) {
                        Text(songPlaying.name)
                            .foregroundStyle(Color.white)
                            .font(.title3)
                        
                            .fontWeight(.semibold)
                            .accessibilityHidden(true)


                        
                        Image(systemName: "circle.fill")
                            .foregroundStyle(Color.white)
                            .font(Font.system(size: 5))
                            .accessibilityHidden(true)
                        Text(songPlaying.artist)
                            .foregroundStyle(.regularMaterial)
                            .font(.title3)
                            .accessibilityHidden(true)

                        

                    }
                    .accessibilityElement(children: .ignore)
                    .accessibilityLabel("Song playing \(songPlaying.name) by \(songPlaying.artist)")
                    
                    HStack{
                        Button{
                            
                        }label: {
                            Image("bluetooth")
                                .resizable()
                                .frame(width: 15, height: 17)
                        }
                        
                        
                        Text("BEATSPILL+")
                            .foregroundStyle(Color.spotifyGreen)
                            .font(.callout)
                            .fontWeight(.regular)
                    }
                    .accessibilityElement(children: .combine)
                    .accessibilityLabel("Bluetooth conected to BEATSPILL+")
                    
                    
                    
                }
                
                Spacer()
                
                HStack(spacing: 20) {
                    
                    Button {
                        
                    }label: {
                        Image("bluetooth")
                            .resizable()
                            .frame(width: 11, height: 20)
                    }.accessibilityLabel("Bluetooth")
                        .accessibilityHint("Change current device connected by bluetooth")
                 
                    
                    Button {
                        
                    }label: {
                        Image(systemName: "pause.fill")
                            .foregroundStyle(.white)
                            .font(.title)
                    }
                    .accessibilityLabel("Pause")

                }
                
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
            .background(Color.cardBackground)
            .clipShape(RoundedRectangle(cornerRadius: 6))
            
            VStack(alignment: .leading) {
                HStack{
                   
                    Image("imageSong")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .accessibilityHidden(true)

                    Spacer()
                    
                    HStack(spacing: 20) {
                        Button{
                            
                        }label: {
                            Image("bluetooth")
                                .resizable()
                                .frame(width: 37, height: 43)
                        }
                        .accessibilityLabel("Bluetooth")
                        .accessibilityHint("Change current device connected by bluetooth")

                        
                        Button{
                            
                        }label: {
                            Image(systemName: "pause.fill")
                                .foregroundStyle(.white)
                                .font(.title)
                        }
                        .accessibilityLabel("Pause")

                        
                    }
                }

                    VStack(alignment: .leading, spacing: 1) {
                        
                            Text(songPlaying.name)
                                .foregroundStyle(Color.white)
                                .font(.title3)
                            
                                .fontWeight(.semibold)

                            
                            Text(songPlaying.artist)
                                .foregroundStyle(.regularMaterial)
                                .font(.title3)

                    }
                    .accessibilityElement(children: .ignore)
                    .accessibilityLabel("Song playing \(songPlaying.name) by \(songPlaying.artist)")
                

                
                
            }

            .padding(.vertical, 12)
            .padding(.horizontal, 16)
            .background(Color.cardBackground)
            .clipShape(RoundedRectangle(cornerRadius: 6))
        }
        
    }
}

#Preview {
    SongPlayingView()
}
