//
//  SingleItemTableViewCell.swift
//  DemoApp
//
//  Created by Dusan Beljin on 17.3.25..
//

import UIKit

class SingleItemTableViewCell: UITableViewCell {
    
    @IBOutlet private var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)    }
    
    public func configure(using viewModel: SingleItemCellProtocol) {
        titleLabel.text = viewModel.title
        titleLabel.font = viewModel.font
        accessoryType = viewModel.hideArrow ? .none : .disclosureIndicator
    }
    
}
