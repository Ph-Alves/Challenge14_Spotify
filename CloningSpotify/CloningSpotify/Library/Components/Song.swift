//
//  Song.swift
//  CloningSpotify
//
//  Created by Rodrigo Barbosa Pereira on 18/05/26.
//

import SwiftUI

struct Song: View {
    var body: some View {
        HStack {
            Image("Les")
                .resizable()
                .frame(width: 67, height: 67)
                .padding(.trailing)
            VStack(alignment: .leading) {
                Text("Les")
                    .font(.headline)
                HStack {
                    RoundedRectangle(cornerRadius: 3)
                        .frame(width: 13, height: 13)
                        .overlay(Text("E").foregroundStyle(.black).font(.system(size: 8)))
                        .foregroundStyle(.libraryGray)
                    Text("Song • Childish Gambino")
                        .font(.subheadline)
                        .foregroundStyle(.libraryGray)
                }
            }
        }
        .padding(.init(top: 0, leading: 0, bottom: 8, trailing: 0))
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    Song()
}
