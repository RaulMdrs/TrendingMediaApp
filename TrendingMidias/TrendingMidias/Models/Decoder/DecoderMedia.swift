//
//  DecoderClass.swift
//  TrendingMidias
//
//  Created by Raul de Medeiros on 02/12/22.
//

// MOVIE INFOS REQUEST https://api.themoviedb.org/3/movie/{movie_id}?api_key=<<api_key>>&language=pt-BR
// TV SHOW INFOS REQUEST https://api.themoviedb.org/3/tv/{tv_id}?api_key=<<api_key>>&language=pt-BR

import Foundation

protocol JsonDecoderProtocol{
    func decodeMedias(_ brain : JsonDecoder, data : Results)
    func failParse(error : Error)
}

struct JsonDecoder{
    let apiURL : String = "https://api.themoviedb.org/3/trending/"
    let key : String = "d8ab08a45dfeb6ee6317a10b502a476a"
    
    var delegate : JsonDecoderProtocol?
    
    func requestMedia(type : String, period : String = "week"){
        let url = URL(string: "\(apiURL)\(type)/\(period)?api_key=\(key)&language=pt-BR")
        print("\(url!)")
        if url != nil{
            var request = URLRequest(url: url!)
            request.httpMethod = "GET"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let session = URLSession.shared
            
            let task = session.dataTask(with: request) { data, response, error in
               // print(String(decoding: data!, as: UTF8.self))
                if let data = data, error == nil{
                    let decoder = JSONDecoder()
                    do{
                        let dateFormat = DateFormatter()
                        dateFormat.dateFormat = "yyyy-MM-dd"
                        decoder.dateDecodingStrategy = .formatted(dateFormat)
                        let result = try decoder.decode(Results.self, from: data)
                        self.delegate?.decodeMedias(self, data: result)
                    }catch let error {
                        delegate?.failParse(error: error)
                    }
                }
            }
            task.resume()
        }
    }
}


