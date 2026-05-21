//
//  PlaylistSearchView.swift
//  CloningSpotify
//
//  Created by Débora Cristina Silva Ferreira on 19/05/26.
//


import SwiftUI

struct PlaylistSearchView: View {
    @State private var seartchText = ""
    @State private var likes = "1,629.529 likes"
    @State private var playlistTime = "6h 48m"
    @Environment(\.horizontalSizeClass) var hSize
    
    var body: some View {
        ZStack(alignment: .bottom){
            LinearGradient(
                stops: [
                    .init(color: Color.backgroundButton, location: 0),
                    .init(color: Color.background, location: 0.6)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            ScrollView {
                VStack{
                    ViewThatFits(in: .horizontal){
                        
                        HStack {
                            
                            SearchBarView()
                           
                            Button {
                                
                                
                            } label: {
                                Text("Sort")
                                    .foregroundStyle(Color.white)
                                    .font(Font.caption)
                                    .fontWeight(.semibold)
                                
                                
                            }
                            .padding(.horizontal)
                            .accessibilityLabel("Sort")
                            .accessibilityHint("Find songs in playlist")
                            .padding(EdgeInsets(top: 11, leading: 15, bottom: 11, trailing: 15))
                            .background(RoundedRectangle(cornerRadius: 6).fill(Color("backgroundButton")))
                        }
                        
                        VStack() {
                            
                            SearchBarView()
                            
                            
                            Button {
                                
                                
                            } label: {
                                Text("Sort")
                                    .foregroundStyle(Color.white)
                                    .font(Font.caption)
                                    .fontWeight(.semibold)
                                
                            }
                            .padding(EdgeInsets(top: 11, leading: 15, bottom: 11, trailing: 15))
                            .background(RoundedRectangle(cornerRadius: 6).fill(Color("backgroundButton")))
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 1)
                    Image("playlistImage")
                        .frame(width: 290, height: 288)
                        .padding(.top, 30)
                        .frame(alignment: .center)
                        .accessibilityLabel("Playlist")

                    HStack {
                        Text("Now and approved indie pop. Cover: No Rome")
                            .foregroundStyle(Color.white)
                            .font(Font.caption)
                            .fontWeight(.light)
                            .padding(.top)
                            .padding(.leading)
                            .accessibilityLabel("Now and approved indie pop. Cover: No Rome")
                        Spacer()
                    }
                    
                    HStack(alignment: .bottom) {
                        VStack(alignment: .leading) {
                            HStack {
                                Image("spotifyIcon")
                                    .accessibilityLabel("Spotify icon")

                                Text("Spotify")
                                    .foregroundStyle(Color.white)
                                    .fontWeight(.bold)
                                    .font(.default)
                                    .accessibilityLabel("Spotify")

                            }
                            
                            HStack {
                                Text(likes)
                                    .foregroundStyle(Color.white)
                                    .font(Font.default)
                                    .fontWeight(.light)
                                    .accessibilityLabel("Number of likes")
                                    .accessibilityHint("1.629,592 likes")

                                Image(systemName: "circle.fill")
                                    .foregroundStyle(Color.white)
                                    .font(Font.system(size: 5))
                                    .accessibilityHidden(true)
                                
                                Text(playlistTime)
                                    .foregroundStyle(Color.white)
                                    .font(Font.default)
                                    .fontWeight(.light)
                                    .accessibilityLabel("Playlist time")
                                    .accessibilityHint("6 hours 48 minutes")


                            }
                            
                            Spacer(minLength: 10)
                            
                            HStack(spacing: 30){
                                Button {
                                    
                                } label: {
                                    Image(systemName: "heart")
                                        .foregroundStyle(Color.gray)
                                        .font(Font.title2)
                                }
                                .accessibilityLabel("Heart")
                                .accessibilityHint("Add playlist to favorites")


                                Button {
                                    
                                } label: {
                                    Image(systemName: "arrow.down.circle")
                                        .foregroundStyle(Color.gray)
                                        .font(Font.title2)
                                        
                                }
                                .accessibilityLabel("Download")
                                .accessibilityHint("Download songs from playlist")
                                
                                Button {
                                    
                                }label: {
                                    Image(systemName: "ellipsis")
                                        .foregroundStyle(Color.gray)
                                        .font(Font.title2)
                                }
                                    .accessibilityLabel("More")
                                    .accessibilityHint("More options in playlist")
                            }
                        }
                        
                        Spacer()
                        
                        Button {
                            
                        } label: {
                            Image("play")

                        }.accessibilityLabel("Play")
                            .accessibilityHint("Start playlist")
                        
                        
                    }
                    .padding(.horizontal)
                    
                    SongsListView()
                    Spacer()
                }
            }
            .scrollIndicators(.hidden)
            .safeAreaInset(edge: .bottom) {
                SongPlayingView()
            }
        }

    }
    
}

#Preview {
    PlaylistSearchView()
}


