//
//  Person.swift
//  StarWarsApp
//
//  Created by Ilya Klimenyuk on 14.11.2020.
//

struct StarWarsCharacter: Decodable {
    let name: String?
    let birth_year: String?
    let height: String?
    let mass: String?
    let gender: String?
    let hair_color: String?
    let skin_color: String?
}

struct WebSiteDescription: Decodable {
    let count: Int?
    let results: [StarWarsCharacter]?
}
