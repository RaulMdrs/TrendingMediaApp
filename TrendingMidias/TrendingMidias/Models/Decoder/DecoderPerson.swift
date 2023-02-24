//
//  DecoderPerson.swift
//  TrendingMidias
//
//  Created by Raul de Medeiros on 08/12/22.
//

import Foundation

protocol JsonDecoderPeopleProtocol{
    func decodePerson(_ brain : JsonDecoderPeople, data : People)
    func failParse(error : Error)
}

struct JsonDecoderPeople{
    let apiURL : String = "https://api.themoviedb.org/3/trending/"
    let key : String = "d8ab08a45dfeb6ee6317a10b502a476a"
    
    var delegate : JsonDecoderPeopleProtocol?
    
    func requestPeople(){
        let url = URL(string: "\(apiURL)person/week?api_key=\(key)&language=pt-BR")
        if url != nil{
            var request = URLRequest(url: url!)
            request.httpMethod = "GET"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let session = URLSession.shared
            
            let task = session.dataTask(with: request) { data, response, error in
                //print(String(decoding: data!, as: UTF8.self))
                if let data = data, error == nil{
                    do{
                     
                        let decoder = JSONDecoder()
                        let dateFormat = DateFormatter()
                        dateFormat.dateFormat = "yyyy-MM-dd"
                        decoder.dateDecodingStrategy = .formatted(dateFormat)
                        let result = try decoder.decode(People.self, from: data)
                        print(result.results.count)
                        self.delegate?.decodePerson(self, data: result)
                    }catch let error {
                        delegate?.failParse(error: error)
                    }
                }
            }
            task.resume()
        }
    }
}
