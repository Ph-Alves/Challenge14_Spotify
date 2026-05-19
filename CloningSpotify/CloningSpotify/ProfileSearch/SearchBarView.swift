//
//  SearchBar.swift
//  CloningSpotify
//
//  Created by Débora Cristina Silva Ferreira on 19/05/26.
//
import SwiftUI

struct SearchBarView: View {
    var body: some View {
        HStack() {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(Color.white)
                .font(Font.caption)
                .fontWeight(.regular)
            
            Text("Find in playlist")
                .foregroundStyle(Color.white)
                .font(Font.caption)
                .fontWeight(.semibold)
            Spacer()
        }
        .padding(EdgeInsets(top: 11, leading: 9, bottom: 11, trailing: 10))
        .background(RoundedRectangle(cornerRadius: 6).fill(Color("backgroundButton")))
    }
}

#Preview {
    SearchBarView()
}
