//
//  Songs.swift
//  Test1_SceneKit tvOS
//
//  Created by Gennaro Giaquinto on 07/08/2019.
//  Copyright © 2019 Gennaro Giaquinto. All rights reserved.
//

import Foundation

//enum Songs {
//    typealias RawValue = SongsType
//
//    case LaCanzoneDelSole = SongsType(author: "LucioBattisti", notes: "1:319149;1:319149;1:638298;2:319149;2:319149;2:638298;3:319149;3:319149;3:638298;2:319149;2:319149;2:638298;1:319149;1:319149;1:638298;2:319149;2:319149;2:638298;3:319149;3:319149;3:638298;2:319149;2:319149;2:638298;1:319149;1:319149;1:638298;2:319149;2:319149;2:638298;3:319149;3:319149;3:638298;2:319149;2:319149;2:638298;1:319149;1:319149;1:638298;2:319149;2:319149;2:638298;3:319149;3:319149;3:638298;2:319149;2:319149;2:638298;")
//    case PeppeGay = SongsType(author: "Gennaro", notes: "3:2:500000;1:500000;4:500000;1:3:500000;")
//}

class Songs: NSObject, NSCoding {
    func encode(with aCoder: NSCoder) {
        aCoder.encode(title, forKey: "title")
        aCoder.encode(author, forKey: "author")
        aCoder.encode(base, forKey: "base")
        aCoder.encode(notes, forKey: "notes")
        aCoder.encode(chords, forKey: "chords")
        let guit = String(self.guitar.rawValue)
        aCoder.encode(guit, forKey: "guitar")
    }

    required init?(coder aDecoder: NSCoder) {
        self.title = aDecoder.decodeObject(forKey: "title") as! String
        self.author = aDecoder.decodeObject(forKey: "author") as! String
        self.base = aDecoder.decodeObject(forKey: "base") as? String
        self.notes = aDecoder.decodeObject(forKey: "notes") as! String
        self.chords = aDecoder.decodeObject(forKey: "chords") as! [String]
        let guit = aDecoder.decodeObject(forKey: "guitar") as! String
        let guitInt = Int(guit)
        self.guitar = GuitarsEnum.init(rawValue: guitInt!)
    }

    var title: String!
    var author: String!
    var base: String?
    var notes: String!
    var chords: [String]!
    var guitar: GuitarsEnum!

    init(title: String, author: String, base: String?, guitar: GuitarsEnum, chords: [String], notes: String) {
        self.title = title
        self.author = author
        self.notes = notes
        self.base = base
        self.chords = chords
        self.guitar = guitar
    }

    static var LaCanzoneDelSole: Songs { return Songs(title: "La canzone del sole", author: "LucioBattisti.jpg", base: nil, guitar: GuitarsEnum.acoustic, chords: ["A.wav", "E.wav", "D.wav", "A.wav"], notes: "1:319149;1:319149;1:638298;2:319149;2:319149;2:638298;3:319149;3:319149;3:638298;2:319149;2:319149;2:638298;1:319149;1:319149;1:638298;2:319149;2:319149;2:638298;3:319149;3:319149;3:638298;2:319149;2:319149;2:638298;1:319149;1:319149;1:638298;2:319149;2:319149;2:638298;3:319149;3:319149;3:638298;2:319149;2:319149;2:638298;1:319149;1:319149;1:638298;2:319149;2:319149;2:638298;3:319149;3:319149;3:638298;2:319149;2:319149;2:638298;") }

    static var PeppeGay: Songs { return Songs(title: "Peppe song", author: "Gruppo.jpeg", base: nil, guitar: GuitarsEnum.electric, chords: ["A.wav", "B.wav", "C.wav", "D.wav"], notes: "3:2:500000;1:500000;4:500000;1:3:500000;") }

    static var KnockinOnHeavensDoor: Songs { return Songs(title: "Knockin' on Heavens Door", author: "BobDylan.jpg", base: "KnockinOnHeavensDoor.mp3", guitar: GuitarsEnum.acoustic, chords: ["G.wav", "D.wav", "Am.wav", "C.wav"], notes: "0:1725350;1:837404;1:837404;2:837404;2:837404;3:837404;3:837404;3:837404;3:837404;1:837404;1:837404;2:837404;2:837404;4:837404;4:837404;4:837404;4:837404;1:837404;1:837404;2:837404;2:837404;3:837404;3:837404;3:837404;3:837404;1:837404;1:837404;2:837404;2:837404;4:837404;4:837404;4:837404;4:837404;1:837404;1:837404;2:837404;2:837404;3:837404;3:837404;3:837404;3:837404;1:837404;1:837404;2:837404;2:837404;4:837404;4:837404;4:837404;4:837404;1:837404;1:837404;2:837404;2:837404;3:837404;3:837404;3:837404;3:837404;1:837404;1:837404;2:837404;2:837404;4:837404;4:837404;4:837404;4:837404;1:837404;1:837404;2:837404;2:837404;3:837404;3:837404;3:837404;3:837404;1:837404;1:837404;2:837404;2:837404;4:837404;4:837404;4:837404;4:837404;1:837404;1:837404;2:837404;2:837404;3:837404;3:837404;3:837404;3:837404;1:837404;1:837404;2:837404;2:837404;4:837404;4:837404;4:837404;4:837404;")}

    static var songs: [Int : Songs] { return [1: Songs.KnockinOnHeavensDoor, 2: Songs.LaCanzoneDelSole, 3: Songs.PeppeGay] }

    static func ==(lhs: Songs, rhs: Songs) -> Bool {
        return lhs.title == rhs.title
    }

}
