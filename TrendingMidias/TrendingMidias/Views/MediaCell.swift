//
//  MediaCell.swift
//  TrendingMidias
//
//  Created by Raul de Medeiros on 02/12/22.
//

import UIKit

class MediaCell: UITableViewCell {
    @IBOutlet weak var posteImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dataLabel: UILabel!
    @IBOutlet weak var votesCountLabel: UILabel!
    @IBOutlet weak var averageLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var loaderView: UIView!
    
    
    func configLayout(media : Media){
        configLoaderView()
        showLoader()
        votesCountLabel.text = String(media.voteCount)
        averageLabel.text = String(media.average)
        overviewLabel.text = media.overview
        print(media.mediaType)
        configImage(media: media)
        dataLabel.text = media.getFormatDate()
        titleLabel.text = media.getNameMedia()
    }
    
    func configImage(media : Media){
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(media.poster)") else { return }
            DispatchQueue.global().async {
                guard let firstData = try? Data(contentsOf: url) else { return }
                DispatchQueue.main.async {
                    self.posteImage.image = UIImage(data: firstData)
                    self.hideLoader()
                }
            }
        
        posteImage.layer.cornerRadius = 20.0
        posteImage.layer.masksToBounds = true
    }
    
    func configView(){
        view.layer.cornerRadius = 20.0
        view.layer.masksToBounds = true
        view.layer.shadowOpacity = 0.5
    }
    
    func showLoader(){
        loaderView.isHidden = false
        activityIndicator.startAnimating()
    }
    func hideLoader(){
        loaderView.isHidden = true
        activityIndicator.stopAnimating()
    }
    
    func configLoaderView(){
        loaderView.layer.cornerRadius = 20.0
        loaderView.layer.masksToBounds = true
    }
}
