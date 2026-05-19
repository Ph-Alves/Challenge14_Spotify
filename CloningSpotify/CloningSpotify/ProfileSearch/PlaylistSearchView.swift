//
//  PlaylistSearchView.swift
//  CloningSpotify
//
//  Created by Débora Cristina Silva Ferreira on 19/05/26.
//


import SwiftUI

struct PlaylistSearch: View {
    @State private var seartchText = ""
    @State private var likes = "1,629.529 likes"
    @State private var playlistTime = "6h 48m"
    
    var body: some View {
        ScrollView {
            
            VStack{
                ViewThatFits(in: .horizontal){
                    
                    HStack {
                        
                        SearchBarView()
                        
                        Spacer(minLength: 7)
                        
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
                    
                    VStack(alignment: .leading) {
                        
                        SearchBarView()
                        
                        Spacer(minLength: 7)
                        
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
                .padding()
                
                Image("playlistImage")
                    .frame(width: 290, height: 288)
                    .padding(.top, 30)
                    .frame(alignment: .center)
                
                HStack {
                    Text("Now and approved indie pop. Cover: No Rome")
                        .foregroundStyle(Color.white)
                        .font(Font.caption)
                        .fontWeight(.light)
                        .padding(.top)
                        .padding(.leading)
                    Spacer()
                }
                
                HStack(alignment: .bottom) {
                    VStack(alignment: .leading) {
                        HStack {
                            Image("spotifyIcon")
                            Text("Spotify")
                                .foregroundStyle(Color.white)
                                .fontWeight(.bold)
                                .font(.default)
                        }
                        
                        HStack {
                            Text(likes)
                                .foregroundStyle(Color.white)
                                .font(Font.default)
                                .fontWeight(.light)
                            Image(systemName: "circle.fill")
                                .foregroundStyle(Color.white)
                                .font(Font.system(size: 5))
                            Text(playlistTime)
                                .foregroundStyle(Color.white)
                                .font(Font.default)
                                .fontWeight(.light)
                        }
                        
                        Spacer(minLength: 10)
                        
                        HStack(spacing: 30){
                            Image(systemName: "heart")
                                .foregroundStyle(Color.gray)
                                .font(Font.title2)
                            Image(systemName: "arrow.down.circle")
                                .foregroundStyle(Color.gray)
                                .font(Font.title2)
                            Image(systemName: "ellipsis")
                                .foregroundStyle(Color.gray)
                                .font(Font.title2)
                        }
                    }
                    
                    Spacer()
                    Image("play")
                    
                    
                }
                .padding(.horizontal)
                
                SongsListView()
                Spacer()
            }
            
            .background(Color.black)
        }
        .background(Color.black)
        
    }
    
}

#Preview {
    PlaylistSearch()
}


