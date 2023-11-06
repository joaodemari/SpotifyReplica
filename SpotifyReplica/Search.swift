//
//  Search.swift
//  SpotifyReplica
//
//  Created by Foundation05 on 31/10/23.
//

import SwiftUI

struct Search: View {
    //    var body: some View {
    //        VStack{Text("Aqui você pesquisa")}
    //    }
    var albumManager : AlbumManager
    @State var searchText = ""
    
    var body: some View {
            NavigationStack  {
                ScrollView{
                    VStack  {

                        ForEach(searchSingles){single in
                            HStack{
                                Image(single.image).resizable().aspectRatio(contentMode: .fit).frame(width: 54, height: 54)
                                VStack{
                                    
                                    Text(single.title)
                                        .foregroundColor(.white)
                                        .frame(maxWidth: .infinity, alignment: .leading).font(.system(size: 20))
                                    Text(single.artist)
                                        .foregroundColor(.gray)
                                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                                        .font(.system(size: 15))
                                }
                                Image(systemName: "ellipsis")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 20))
                                    .rotationEffect(.degrees(90))
                            }.frame(height:60)
                        }}
                    
                }.padding().frame(maxWidth: .infinity, maxHeight: .infinity ).background(.black).scrollContentBackground(.hidden).tint(.white)
            }.searchable(text: $searchText).accentColor(.white).foregroundColor(Color.white)    .toolbarBackground(.hidden)
    }
    
    
    var searchSingles: [Single] {
        var singles: [Single] = []
        for album in albumManager.albuns{
            for single in album.singles{
                singles.append(single)
            }
        }
            
            if searchText.isEmpty {
                return singles
            } else {
                return singles.filter { $0.title.lowercased().contains(searchText.lowercased()) || $0.artist.lowercased().contains(searchText.lowercased())}
            }
        }
}



#Preview {
    ContentView()
}
