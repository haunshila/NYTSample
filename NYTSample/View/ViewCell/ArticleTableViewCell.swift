//
//  ArticleTableViewCell.swift
//  NYTSample
//
//  Created by hauyadav on 08/10/18.
//  Copyright © 2018 mycompany. All rights reserved.
//

import UIKit
import SDWebImage

class ArticleTableViewCell: UITableViewCell {
    @IBOutlet weak var articleImage: CircleImage!
    @IBOutlet weak var articleTitle: UILabel!
    @IBOutlet weak var articleByline: UILabel!
    @IBOutlet weak var articleDate: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var viewModel: ArticleCellViewModel? {
        didSet {
            bindViewModel()
        }
    }
    
    private func bindViewModel() {
        if let url = viewModel?.articleItem.media?[0].mediaMetadata?[0].url{
            articleImage.sd_setImage(with: URL(string: (url)))
            
        }

        articleTitle.text = viewModel?.articleItem.title
        articleByline.text = viewModel?.articleItem.byline
        articleDate.text = viewModel?.articlePublishedDate
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
