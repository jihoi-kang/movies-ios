//
//  MovieTableViewCell.swift
//  movies
//
//  Created by Jihoi Kang on 2022/06/10.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var label: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func bind(_ item: Movie) {
        label.text = item.title
    }
    
}
