//
//  DecoderInfo.swift
//  TrendingMidias
//
//  Created by Raul de Medeiros on 07/12/22.
//

import Foundation

protocol DecoderInfoMovieProtocol{
    func decodeMovie(_ brain : DecoderInfoMovie, data : Movie)
    func failParse(error : Error)
}

struct DecoderInfoMovie{
    var delegate : DecoderInfoMovieProtocol?
    
    func requestMovie(movie : Media){
        let url = URL(string: movie.getRequestURL())
        
        print(url!)
        if url != nil{
            var request = URLRequest(url: url!)
            request.httpMethod = "GET"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let session = URLSession.shared
            
            let task = session.dataTask(with: request) { data, response, error in
                print(String(decoding: data!, as: UTF8.self))
                if let data = data, error == nil{
                    let decoder = JSONDecoder()
                    do{
                        let dateFormat = DateFormatter()
                        dateFormat.dateFormat = "yyyy-MM-dd"
                        decoder.dateDecodingStrategy = .formatted(dateFormat)
                        let result = try decoder.decode(Movie.self, from: data)
                        self.delegate?.decodeMovie(self, data: result)
                    }catch let error {
                        delegate?.failParse(error: error)
                    }
                }
            }
            task.resume()
        }
    }
}

protocol DecoderInfoTVProtocol{
    func decodeMovie(_ brain : DecoderInfoTV, data : TvShow)
    func failParse(error : Error)
}

struct DecoderInfoTV{
    var delegate : DecoderInfoTVProtocol?
    
    func requestTvShow(tvShow : Media){
        let url = URL(string: tvShow.getRequestURL())
        //print(url)
        //print(url!)
        if url != nil{
            var request = URLRequest(url: url!)
            request.httpMethod = "GET"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let session = URLSession.shared
            
            let task = session.dataTask(with: request) { data, response, error in
                //print(String(decoding: data!, as: UTF8.self))
                if let data = data, error == nil{
                    let decoder = JSONDecoder()
                    do{
                        let dateFormat = DateFormatter()
                        dateFormat.dateFormat = "yyyy-MM-dd"
                        decoder.dateDecodingStrategy = .formatted(dateFormat)
                        let result = try decoder.decode(TvShow.self, from: data)
                        self.delegate?.decodeMovie(self, data: result)
                    }catch let error {
                        delegate?.failParse(error: error)
                    }
                }
            }
            task.resume()
        }
    }
}
