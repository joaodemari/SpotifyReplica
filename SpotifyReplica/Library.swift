//
//  Library.swift
//  SpotifyReplica
//
//  Created by Foundation10 on 01/11/23.
//

import SwiftUI


struct Library: View {
    var albumManager:AlbumManager

//
//    let music: [Music] = [
//        Music(title: "Músicas Curtidas", tYpe: "Playlist", author: "• 26 músicas"),
//        Music(title: "Novos episódios", tYpe: "Atualizado hoje", author: ""),
//        Music(title: "x", tYpe: "x", author: "x"),
//        Music(title: "x", tYpe: "x", author: "x"),
//        Music(title: "x", tYpe: "x", author: "x"),
//        Music(title: "x", tYpe: "x", author: "x"),
//        Music(title: "x", tYpe: "x", author: "x"),
//        Music(title: "x", tYpe: "x", author: "x"),
//    ]
//    
    
    
    struct MusicRow: View {
        let music: Album
        var body: some View {
                HStack {
                    Image(music.image)
                        .resizable()
                        .frame(maxWidth: 80, maxHeight: 80)
                    VStack (alignment: .leading) {
                        Text (music.title)
                            .foregroundColor(.white)
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                            .font(.system(size: 18))
                            .fontWeight(.bold)
                        Spacer().frame(height: 6)
                        HStack {
                            Text (music.type)
                                .foregroundColor(.gray)
                                .frame(alignment: .leading)
                                .font(.system(size: 14))
                            Text (music.artist)
                                .foregroundColor(.gray)
                                .frame(alignment: .leading)
                                .font(.system(size: 14))
                        }
                    }
                }
            }
    }
    
    var body: some View {
        VStack {
            HStack {
                Spacer().frame(width: 15)
                Image(systemName: "a.circle.fill")
                    .foregroundColor(.orange)
                    .font(.system(size: 35))
                Spacer().frame(width: 15)
                Text("Sua Biblioteca")
                    .foregroundColor(.white)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity,alignment: .leading)
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.white)
                    .font(.system(size: 25))
                    .fontWeight(.bold)
            }
            List(albumManager.albuns, id: \.title) { elemento in
                    MusicRow(music: elemento)
                        .listRowBackground(Color.black)
                }.listStyle(.plain)
            }
        .background(.black)
        .scrollContentBackground(.hidden)
        }
    }

#Preview {
    ContentView()
}

