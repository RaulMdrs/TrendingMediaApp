//
//  SetPlural.swift
//  TrendingMidias
//
//  Created by Raul de Medeiros on 08/12/22.
//

import Foundation

struct setPlural{
    static func setPluralTemporada(value : Int) -> String{
        if value > 1{
            return "temporadas"
        }
        else{
            return "temporada"
        }
    }
    
    static func setPluralEpisodes(value : Int) -> String{
        if value > 1{
            return "episódios"
        }else{
            return "episódio"
        }
    }
}
