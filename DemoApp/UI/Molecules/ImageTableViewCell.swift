//
//  ImageTableViewCell.swift
//  DemoApp
//
//  Created by Dusan Beljin on 18.3.25..
//

import UIKit
import SDWebImage

class ImageTableViewCell: UITableViewCell {

    @IBOutlet private var smallImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(using: ImageCellProtocol) {
        guard let urlString = using.url else { return }
        smallImageView.sd_setImage(with: URL(string: urlString)!)
    }
}
