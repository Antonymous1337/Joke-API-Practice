//
//  JokeFlags.swift
//  Joke API Practice
//
//  Created by Antony Holshouser on 11/10/24.
//

import Foundation

struct JokeFlags: Decodable {
    var nsfw: Bool?
    var religious: Bool?
    var political: Bool?
    var racist: Bool?
    var sexist: Bool?
    var explicit: Bool?
}
