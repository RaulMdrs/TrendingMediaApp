//
//  ConvertIntToString.swift
//  TrendingMidias
//
//  Created by Raul de Medeiros on 08/12/22.
//

import Foundation

struct ConvertIntToString{
    static func convertValue(value : Int) -> String{
        if value == 0 {
            return "Não informado"
        }
        else {
            return String(value) + ",00"
        }
    }
}
