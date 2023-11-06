//
//  ContentView.swift
//  albumSpotify
//
//  Created by Foundation10 on 31/10/23.
//

import SwiftUI

struct AlbumPage: View {
    var album:Album
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack {
                    Image(album.image)
                        .resizable().aspectRatio(contentMode: .fit).frame(width: 300, height: 300)
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                    Text(album.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading).font(.system(size: 28))
                    Spacer().frame(height: 15)
                    Text(album.artist)
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity,alignment: .leading)
                    Spacer().frame(height: 15)
                    Text("Álbum • 2018")
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity,alignment: .leading)
                    VStack(spacing:16){
                        HStack {
                            Image(systemName: "heart")
                                .foregroundColor(.gray)
                                .font(.system(size: 30))
                            Spacer().frame(width: 25)
                            Image(systemName: "arrow.down.circle")
                                .foregroundColor(.gray)
                                .font(.system(size: 30))
                            Spacer().frame(width: 25)
                            Image(systemName: "ellipsis")
                                .foregroundColor(.gray)
                                .font(.system(size: 30))
                                .rotationEffect(.degrees(90))
                            Spacer().frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                            Image(systemName: "shuffle")
                                .foregroundColor(.gray)
                                .font(.system(size: 30))
                            Image(systemName: "play.circle.fill")
                                .foregroundColor(.button1Spotify)
                                .font(.system(size: 50))
                        }
                        
                        ForEach(album.singles){single in
                            HStack{
                                VStack{
                                    Text(single.title)
                                        .foregroundColor(.white)
                                        .frame(maxWidth: .infinity, alignment: .leading).font(.system(size: 20))
                                    Text(album.artist)
                                        .foregroundColor(.gray)
                                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                                        .font(.system(size: 15))
                                }
                                Image(systemName: "ellipsis")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 20))
                                    .rotationEffect(.degrees(90))
                            }
                        }}
                    
                }
                .padding().frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                
            } .background(
                LinearGradient(gradient: Gradient(colors: [.graySpotify, .black]), startPoint: .top, endPoint: .bottom))
        }.accentColor(.black)
    }
}
    #Preview {
        ContentView()
    }
