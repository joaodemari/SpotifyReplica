//
//  AlbumManager.swift
//  SpotifyReplica
//
//  Created by Foundation05 on 01/11/23.
//

import Foundation

class AlbumManager {
    var albuns: [Album] = []

    init() {
        let afterHours = Album(
            title: "After Hours",
            image: "after_hours",
            artist: "The Weeknd",
            singles: [Single(title: "Alone Again", image: "after_hours", artist: "The Weeknd", seconds: 240),Single(title: "Too Late", image: "after_hours", artist: "The Weeknd", seconds: 220), Single(title: "Hardest To Love", image: "after_hours", artist: "The Weeknd", seconds: 200), Single(title: "Scared To Live", image: "after_hours", artist: "The Weeknd", seconds: 230), Single(title: "Snowchild", image: "after_hours", artist: "The Weeknd", seconds: 210), Single(title: "Escape from LA", image: "after_hours", artist: "The Weeknd", seconds: 235), Single(title: "Heartless", image: "after_hours", artist: "The Weeknd", seconds: 225), Single(title: "Faith", image: "after_hours", artist: "The Weeknd", seconds: 215), Single(title: "Blinding Lights", image: "after_hours", artist: "The Weeknd", seconds: 230), Single(title: "In Your Eyes", image: "after_hours", artist: "The Weeknd", seconds: 210), Single(title: "Save Your Tears", image: "after_hours", artist: "The Weeknd", seconds: 220) , Single(title: "Repeat After Me (interlude)", image: "after_hours", artist: "The Weeknd", seconds: 180), Single(title: "After Hours", image: "after_hours", artist: "The Weeknd", seconds: 200), Single(title: "Until I Bleed Out", image: "after_hours", artist: "The Weeknd", seconds: 210)
]
        )
        let forAllTheDogs = Album(
            title: "For All The Dogs",
            image: "for_all_the_dogs",
            artist: "Drake",
            singles: []
        )
        let blond = Album(
            title: "Blond",
            image: "blond",
            artist: "Frank Ocean",
            singles: []
        )
        let heroesAndVillains = Album(
            title: "Heroes & Villains",
            image: "heroes_and_villains",
            artist: "Metro Boomin",
            singles: []
        )
        let thisIsTimMaia = Album(
            title: "This is Tim Maia",
            image: "this_is_tim_maia",
            artist: "Tim Maia",
            singles: []
        )
        let bad = Album(
                    title: "Bad",
                    image: "bad",
                    artist: "Michael Jackson",
                    singles: []
        )
        // Nomes das músicas do álbum "Bad" de Michael Jackson
        let songTitles = ["Bad", "The Way You Make Me Feel", "Speed Demon", "Liberian Girl", "Just Good Friends", "Another Part of Me", "Man in the Mirror", "I Just Can't Stop Loving You", "Dirty Diana", "Smooth Criminal"]

        // Crie um array de singles com base nos nomes das músicas
        var singlesArray: [Single] = []
        for title in songTitles {
            let single = Single(title: title, image: "bad", artist: "Michael Jackson", seconds: 200) // Substitua "0" pela duração da música em segundos.
            singlesArray.append(single)
        }

        // Adicione o array de singles ao álbum "Bad" de Michael Jackson
        bad.singles = singlesArray
        
        // Nomes das músicas do álbum "Blond" de Frank Ocean
        let songTitlesBlond = [
            "Nikes (feat. KOHH)",
            "Ivy",
            "Pink + White (feat. Beyoncé)",
            "Be Yourself",
            "Solo",
            "Skyline To (feat. Kendrick Lamar)",
            "Self Control",
            "Good Guy",
            "Nights",
            "Solo (Reprise) (feat. Andre 3000)",
            "Pretty Sweet",
            "Facebook Story (feat. Sebastian)",
            "Close To You",
            "White Ferrari (feat. James Blake & Bon Iver)",
            "Seigfried",
            "Godspeed (feat. Kim Burrell)",
            "Futura Free"
        ]

        // Crie um array de singles com base nos nomes das músicas
        var blondSinglesArray: [Single] = []
        for title in songTitlesBlond {
            let single = Single(title: title, image: "blond", artist: "Frank Ocean", seconds: 200) // Substitua "0" pela duração real da música em segundos.
            blondSinglesArray.append(single)
        }
        
        blond.singles = blondSinglesArray


        // Adicione os álbuns à lista
        albuns.append(afterHours)
        albuns.append(forAllTheDogs)
        albuns.append(blond)
        albuns.append(heroesAndVillains)
        albuns.append(thisIsTimMaia)
        albuns.append(bad)
    }
}



class Album{
    var title: String
    var image: String
    var artist: String
    var singles: [Single]
    var type = "Album"
    
    init(title: String, image: String, artist: String, singles: [Single]) {
        self.title = title
        self.image = image
        self.artist = artist
        self.singles = singles
    }
}

class Single : Identifiable, ObservableObject{
    var id = UUID()
    var title: String
    var image: String
    var artist: String
    var seconds: Int
    var type = "Single"
    
    init(title: String, image: String, artist: String, seconds: Int) {
        self.title = title
        self.image = image
        self.artist = artist
        self.seconds = seconds
    }
    
}
