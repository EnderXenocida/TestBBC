//
//  NewsCollectionViewCell.swift
//  BBC
//
//  Created by GlobalTMS on 22/02/2019.
//  Copyright © 2019 Adrián Egea. All rights reserved.
//

import UIKit

let NewsCollectionViewCellIdentifier = "NewsCollectionViewCell"

struct NewsCollectionViewCellStruct {
    let title: String?
    let date: String?
    let description: String?
    let image: String?
}

class NewsCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupCell(_ data: NewsCollectionViewCellStruct) {
        titleLabel.text = data.title
        dateLabel.text = data.date
        descriptionLabel.text = data.description
        thumbnailImageView.loadRemoteImage(data.image ?? "")
    }
}
