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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupObserve()
    }
    
    private func setupObserve() {
        assert(viewModel != nil)
        
        let input = MovieDetailViewModel.Input()
        
        let output = viewModel.transform(input: input)
        
        output.movie.asDriver()
            .drive(onNext: { [weak self] movie in
                guard let self = self else { return }
                self.titleLabel.text = movie?.title
                self.releaseDateLabel.text = movie?.releaseDate
                self.descriptionLabel.text = movie?.overview
                self.backgroundImage.kf.setImage(with: URL(string: movie?.backgroundUrl ?? ""))
            })
            .disposed(by: disposeBag)
    }

}
