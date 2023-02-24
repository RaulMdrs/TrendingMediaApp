//
//  ViewController.swift
//  TrendingMidias
//
//  Created by Raul de Medeiros on 02/12/22.
//

import UIKit

class MoviesScreenViewController: UIViewController {
    
    @IBOutlet var mediaTableView: UITableView!
    var listMedias : Results?
    var jsonParse : JsonDecoder = JsonDecoder()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Movies"
        mediaTableView.delegate = self
        mediaTableView.dataSource = self
        jsonParse.delegate = self
        jsonParse.requestMedia(type: "movie")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tabBarController?.tabBar.tintColor = .blue
        tabBarController?.tabBar.isHidden = false
    }
}

