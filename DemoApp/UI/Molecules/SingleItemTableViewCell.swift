//
//  SingleItemTableViewCell.swift
//  DemoApp
//
//  Created by Dusan Beljin on 17.3.25..
//

import UIKit

class SingleItemTableViewCell: UITableViewCell {
    
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet weak var arrowImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func configure(using viewModel: SingleItemCellProtocol) {
        titleLabel.text = viewModel.title
        arrowImage.isHidden = viewModel.hideArrow
    }
    
}
