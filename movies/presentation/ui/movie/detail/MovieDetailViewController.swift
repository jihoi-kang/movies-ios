//
//  MovieDetailViewController.swift
//  movies
//
//  Created by Jihoi Kang on 2022/06/09.
//

import UIKit

class MovieDetailViewController: BaseViewController<MovieDetailViewModel> {
    
    @IBOutlet var backgroundImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var releaseDateLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    var movie: UiMovieModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUi()
    }
    
    private func setupUi() {
        titleLabel.text = movie?.title
        releaseDateLabel.text = movie?.releaseDate
        descriptionLabel.text = movie?.overview
        backgroundImage.kf.setImage(with: URL(string: movie?.backgroundUrl ?? ""))
    }

}
