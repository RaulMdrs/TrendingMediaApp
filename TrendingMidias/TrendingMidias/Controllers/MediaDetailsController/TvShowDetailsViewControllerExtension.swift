//
//  TvShowDetailsViewControllerExtension.swift
//  TrendingMidias
//
//  Created by Raul de Medeiros on 07/12/22.
//

import UIKit

extension TVShowsDetailsViewController : DecoderInfoTVProtocol{
    func failParse(error: Error) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Ops, algo deu errado", message: "Houve um erro inesperado, tente novamente em alguns instantes", preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "retornar", style: .cancel))
            
            self.present(alert, animated: true)
        }
    }
    
    func decodeMovie(_ brain: DecoderInfoTV, data: TvShow) {
        DispatchQueue.main.async {
            self.seasonsLabel.text = String(data.numberOfSeasons) + " " + setPlural.setPluralTemporada(value: data.numberOfSeasons)
            self.episodesLabel.text = String(data.numberOfEpisodes) + " " + setPlural.setPluralEpisodes(value: data.numberOfEpisodes)
            self.tv = data
        }
    }
}
