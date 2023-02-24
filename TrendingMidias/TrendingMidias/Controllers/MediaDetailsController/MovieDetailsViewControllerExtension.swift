//
//  MovieDetailsViewControllerExtension.swift
//  TrendingMidias
//
//  Created by Raul de Medeiros on 07/12/22.
//

import UIKit

extension MovieDetailsViewController : DecoderInfoMovieProtocol{
    func decodeMovie(_ brain: DecoderInfoMovie, data: Movie) {
        DispatchQueue.main.async {
            if data.budget == 0 {
                
            }
            self.budgetLabel.text = ConvertIntToString.convertValue(value: data.budget)
            self.revenueLabel.text = ConvertIntToString.convertValue(value: data.revenue)
            self.movie = data
        }
    }

    func failParse(error: Error) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Ops, algo deu errado", message: "Houve um erro inesperado, tente novamente em alguns instantes", preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "retornar", style: .cancel))
            
            self.present(alert, animated: true)
        }
    }
}
