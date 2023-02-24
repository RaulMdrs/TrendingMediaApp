//
//  MediaDetailsViewController.swift
//  TrendingMidias
//
//  Created by Raul de Medeiros on 06/12/22.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    var media : Media?
    var movie : Movie?
    var requestMovieInfoProtocol : DecoderInfoMovie = DecoderInfoMovie()
    
    @IBOutlet weak var revenueLabel: UILabel!
    @IBOutlet weak var budgetLabel: UILabel!
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
        requestMovieInfoProtocol.delegate = self
        tabBarController?.tabBar.isHidden = true
        //showLoader()
        activityIndicator.startAnimating()
        configLayout()
        configImage()

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.popToRootViewController(animated: true)
    }
    override func viewDidAppear(_ animated: Bool) {
        requestMovieInfoProtocol.requestMovie(movie: media!)
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
       // circleProgressView.progressClr = .green
        
//        UIView.animate(withDuration: 2, animations: {
//            self.circleProgressView.progressClr = .green
//        })
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
    
    @IBAction func homepageButtonPressed(_ sender: Any) {
        let url = URL(string: movie!.homepage)
        UIApplication.shared.open(url!)
    }
    
}

