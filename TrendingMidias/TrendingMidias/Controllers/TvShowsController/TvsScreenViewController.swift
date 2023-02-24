//
//  TvsScreenViewController.swift
//  TrendingMidias
//
//  Created by Raul de Medeiros on 05/12/22.
//

import UIKit

class TvsScreenViewController: UIViewController {

    @IBOutlet var mediaTableView: UITableView!
    var listMedias : Results?
    var jsonParse : JsonDecoder = JsonDecoder()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Tv Show"
        mediaTableView.delegate = self
        mediaTableView.dataSource = self
        jsonParse.delegate = self
        jsonParse.requestMedia(type: "tv")
    }

    override func viewDidAppear(_ animated: Bool) {
        tabBarController?.tabBar.tintColor = .purple
        tabBarController?.tabBar.isHidden = false
    }
}
