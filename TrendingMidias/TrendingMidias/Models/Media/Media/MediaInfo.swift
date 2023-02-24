//
//  MidiaInfo.swift
//  TrendingMidias
//
//  Created by Raul de Medeiros on 02/12/22.
//

import Foundation

struct Media : Codable{
    var adult : Bool
    var backdropPath : String?
    var id : Int
    var title : String?
    var name : String?
    var overview : String
    var poster : String
    var mediaType : String
    var releaseDate : Date?
    var firstAirDate : Date?
    var average : Double
    var voteCount : Int

    enum CodingKeys: String, CodingKey {
        case adult = "adult"
        case backdropPath = "backdrop_path"
        case id = "id"
        case title = "title"
        case name = "name"
        case overview = "overview"
        case poster = "poster_path"
        case mediaType = "media_type"
        case releaseDate = "release_date"
        case firstAirDate = "first_air_date"
        case average = "vote_average"
        case voteCount = "vote_count"
    }
    
    func getFormatDate() ->String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        if mediaType == "movie"{
            return dateFormatter.string(from: self.releaseDate!)
        }
        else{
            return dateFormatter.string(from: self.firstAirDate!)
        }
    }
    
    func getNameMedia() -> String{
        if mediaType == "movie"{
            return title!
        }
        else{
            return name!
        }
    }
    
    func getRequestURL() -> String
    {
        return "https://api.themoviedb.org/3/\(mediaType)/\(id)?api_key=d8ab08a45dfeb6ee6317a10b502a476a"
    }
}
