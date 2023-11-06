//
//  ContentView.swift
//  SpotifyReplica
//
//  Created by Foundation05 on 30/10/23.
//

import SwiftUI

struct ContentView: View {
    var albumManager : AlbumManager = AlbumManager()
    var body: some View {
        TabView{
            Home(albumManager:albumManager).tabItem {
                Label("Home", systemImage: "house.fill")
            }.toolbarBackground(.visible, for: .tabBar).toolbarBackground(.backgroundSpotify, for: .tabBar)
            Search(albumManager:albumManager).tabItem {
                Label("Search", systemImage: "magnifyingglass")
            }.toolbarBackground(.visible, for: .tabBar).toolbarBackground(.backgroundSpotify, for: .tabBar)
            Library(albumManager:albumManager).tabItem {
                Label("Library", systemImage: "books.vertical")
            }.toolbarBackground(.visible, for: .tabBar).toolbarBackground(.backgroundSpotify, for: .tabBar)
            
        }
    }
}

struct Home:View {
    var albumManager : AlbumManager
    var body: some View {
        
                NavigationStack{
                    
                    VStack(spacing:24){
                        Header()
                        ScrollView{
                            VStack(spacing:24){
                                AlbumGrid(albumManager: albumManager)
                                AlbumHits(albumManager: albumManager)
                                AlbumHighLight()
                            }
                        }
                    }
                .frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .top).padding().background(Color(Color.backgroundSpotify))
            }
    }
}

struct AlbumHits : View {
    var albumManager: AlbumManager
    var body: some View {
        VStack{
            Text("Os maiores Hits do momento").foregroundStyle(.white).fontWeight(.bold).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading).font(.title3)
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing:16){
                    ForEach(albumManager.albuns, id: \.self.title){album in
                        PlaylistBigComponent(album: album)
                    }
                }
            }.frame(maxHeight: 180)
        }
    }
}

struct PlaylistBigComponent : View {
    var album: Album
    var body: some View {
        VStack{
            Image(album.image).resizable().aspectRatio(contentMode: .fit)
            Text("Escute o novo álbum de \(album.artist): \(album.title)").foregroundStyle(.graySubTitle).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading).font(.caption2).fontWeight(.bold).lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
        }.frame(maxWidth: 140)
    }
}

struct AlbumHighLight : View{
    var body: some View{
        VStack(spacing:16){
            HStack{
                Image("bad").resizable().aspectRatio(contentMode: .fit).frame(width: 48, height: 48).clipShape(Circle())
                VStack{
                    Text("Novo lançamento de").foregroundStyle(.graySubTitle).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading).font(.caption2).fontWeight(.bold)

                    Text("Michael Jackson").foregroundStyle(.white).fontWeight(.bold).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading).font(.title3)
                }
            }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            HStack{
                Image("bad").resizable().aspectRatio(contentMode: .fit)
                VStack{
                    Text("Bad").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).foregroundColor(.white).font(.caption2).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                    Text("Album · Michael Jackson").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).foregroundColor(.graySubTitle).font(.caption2).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                    Spacer()
                    HStack{
                        Image(systemName: "plus.circle").font(.system(size:20)).foregroundColor(.graySubTitle)
                        Spacer()
                        Image(systemName: "play.circle.fill").font(.system(size:32)).foregroundColor(.white)
                    }
                }.padding(EdgeInsets(top: 16, leading: 8, bottom: 16, trailing: 16))
                
            }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,maxHeight: 140,  alignment: .leading).background(Color(Color.graySpotify)).cornerRadius(8)
        }
    }
}

struct Header: View{
    @State var currentlySelectedId: Int = 0
    var body: some View{
        HStack(spacing: 8){
            Image("bad").resizable().aspectRatio(contentMode: .fit).frame(width: 32, height: 32).clipShape(Circle())
            HeaderButton(name: "Tudo",id:0,  currentlySelectedId: $currentlySelectedId)
            HeaderButton(name: "Música" ,id:1,  currentlySelectedId: $currentlySelectedId)
            HeaderButton(name: "Podcasts e programas",id:2,  currentlySelectedId: $currentlySelectedId)
        }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
    }
}

struct HeaderButton: View{
    var name: String
    let id: Int
    @Binding var currentlySelectedId: Int
    
    var body: some View{
        Button(name){
         self.currentlySelectedId = self.id
        }.padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16)).foregroundColor(id == currentlySelectedId ?.backgroundSpotify:.white).background(id == currentlySelectedId ?Color(.button1Spotify):Color(.graySpotify)).fontWeight(.semibold).font(.system(size:9)).cornerRadius(40)
    }
}

struct AlbumGrid: View {
    var albumManager : AlbumManager
    var body: some View {
        HStack {
            VStack{
                ForEach(0..<3, id: \.self.description){index in
                    AlbumComponent(album: albumManager.albuns[index])
                }
            }
            VStack{
                ForEach(3..<6, id: \.self.description){index in
                    AlbumComponent(album: albumManager.albuns[index])
                }
            }
        }
    }
}

struct AlbumComponent: View {
    var album : Album
    var body: some View{
        HStack{
            NavigationLink(destination: AlbumPage(album: album)) {
                Image(album.image).resizable().aspectRatio(contentMode: .fit).frame(width: 54, height: 54)
                Text(album.title).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).foregroundColor(.white).font(.caption2)
            }
            
        }.frame(maxWidth:.infinity, maxHeight:54, alignment: .leading).background(Color(Color.graySpotify)).cornerRadius(4)
    }
}


#Preview {
    ContentView()
}
