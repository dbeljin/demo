//
//  LargeImageViewController.swift
//  DemoApp
//
//  Created by Dusan Beljin on 18.3.25..
//

import UIKit
import SDWebImage

class LargeImageViewController: UIViewController {

    @IBOutlet private weak var largeImageView: UIImageView!
    public var imageObject: Item?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let imageObject, let imageURL = imageObject.src else { return }
        title = imageObject.getTitle()
        largeImageView.sd_setImage(with: URL(string: imageURL)!)
    }

}
