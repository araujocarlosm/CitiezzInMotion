//
//  CityDTO.swift
//  CitiezzInMotion
//
//  Created by Carlos Mario Araujo on 3/01/25.
//
import Foundation

struct CityDTO: Decodable, Hashable {
    var country, name: String
    var id: Int
    var coord: Coordinates

    enum CodingKeys: String, CodingKey {
        case country, name
        case id = "_id"
        case coord
    }
}
