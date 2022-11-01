//
//  MovieTableViewCell.swift
//  movies
//
//  Created by Jihoi Kang on 2022/06/10.
//

import UIKit
import Kingfisher

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func bind(_ item: UiMovieModel) {
        if let url = URL(string: item.posterUrl) {
            thumbnail.kf.setImage(with: url)
        } else {
            thumbnail.image = UIImage(systemName: "film")
        }
        
        titleLabel.text = item.title.removeHtmlTags()
        dateLabel.text = item.releaseDate
    }
    
}
