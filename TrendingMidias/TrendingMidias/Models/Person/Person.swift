//
//  Person.swift
//  TrendingMidias
//
//  Created by Raul de Medeiros on 02/12/22.
//

import Foundation

struct Person : Codable{
    var name : String
    var popularity : Float
    var knowForDepartament  : String
    var pathImage : String?
    var knowFor : [Media]?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case popularity = "popularity"
        case knowForDepartament = "known_for_department"
        case pathImage = "profile_path"
        case knowFor = "known_for"
    }
}
