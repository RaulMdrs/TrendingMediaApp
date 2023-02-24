//
//  TvShowDetailsViewController.swift
//  TrendingMidias
//
//  Created by Raul de Medeiros on 07/12/22.
//

import UIKit

class TVShowsDetailsViewController: UIViewController {
    var media : Media?
    var tv : TvShow?
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var episodesLabel: UILabel!
    @IBOutlet weak var seasonsLabel: UILabel!
    
    var requestTvInfoProtocol : DecoderInfoTV = DecoderInfoTV()
    
    @IBOutlet weak var circleProgressView: CircleProgressView!
    
    @IBOutlet weak var infosView: UIView!
    @IBOutlet weak var percentLabel: UILabel!
    @IBOutlet weak var backdropImage : UIImageView!
    @IBOutlet weak var overviewLabel : UILabel!
    @IBOutlet weak var nameLabel : UILabel!
//    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
//    @IBOutlet weak var loaderView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
        requestTvInfoProtocol.delegate = self
        configLayout()
        configImage()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        requestTvInfoProtocol.requestTvShow(tvShow: media!)
    }

    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    func configLayout(){
        nameLabel.text = media?.getNameMedia()
        overviewLabel.text = media?.overview
        
        nameLabel.layer.cornerRadius = 10
        nameLabel.layer.masksToBounds = true
        
        overviewLabel.layer.cornerRadius = 15
        overviewLabel.layer.masksToBounds = true
        
        circleProgressView.progressLyr.lineWidth = 15
        circleProgressView.trackLyr.lineWidth = 12
        
        infosView.layer.cornerRadius = 15
        infosView.layer.masksToBounds = true
        
        circleProgressView.setProgressWithAnimation(duration: 2, value: Float(media!.average / 10))
        let averageInt = Int(media!.average * 10)
        percentLabel.text = "\(averageInt)%"
    }

    func configImage(){
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/" + media!.backdropPath!) else { return }
            DispatchQueue.global().async {
                guard let firstData = try? Data(contentsOf: url) else { return }
                DispatchQueue.main.async {
                    self.backdropImage.image = UIImage(data: firstData)
                    self.activityIndicator.stopAnimating()
                    self.activityIndicator.isHidden = true
                }
            }
    }
    
    @IBAction func buttonHomepagePressed(_ sender: UIButton) {
        print(tv!.homepage)
        let url = URL(string: tv!.homepage)
        UIApplication.shared.open(url!)
    }
}
