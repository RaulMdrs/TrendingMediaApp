//
//  TvShowInfo.swift
//  TrendingMidias
//
//  Created by Raul de Medeiros on 07/12/22.
//

import Foundation

struct TvShow : Codable{
    var homepage : String
    var numberOfEpisodes : Int
    var numberOfSeasons : Int
    
    enum CodingKeys: String, CodingKey {
        case homepage = "homepage"
        case numberOfEpisodes = "number_of_episodes"
        case numberOfSeasons = "number_of_seasons"
    }
}
