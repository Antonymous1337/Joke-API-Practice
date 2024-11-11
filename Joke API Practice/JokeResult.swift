//
//  jokeResult.swift
//  Joke API Practice
//
//  Created by Antony Holshouser on 11/10/24.
//

import Foundation

struct JokeResult: Decodable {
    var error: Bool?
    var category: String?
    var type: String?
    var joke: String?
    var flags:JokeFlags?
    var safe: Bool?
    var id: Int?
    var lang: String?
}
