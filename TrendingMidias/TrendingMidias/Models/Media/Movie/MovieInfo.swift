//
//  MovieInfo.swift
//  TrendingMidias
//
//  Created by Raul de Medeiros on 07/12/22.
//

import Foundation

struct Movie : Codable{
    var budget : Int
    var genres : [Genre]
    var homepage : String
    var revenue : Int
    var tagline : String
}
