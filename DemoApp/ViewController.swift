//
//  ViewController.swift
//  DemoApp
//
//  Created by Dusan Beljin on 15.3.25..
//

import UIKit

class ViewController: UIViewController {
    private let testUrl = "https://run.mocky.io/v3/9b27a9ff-886d-42b6-9501-950e1fd1598b"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Testing API call implementation, will move this later into viewModel with UI implementation
        ApiRequest.request(fromUrl: testUrl, httpMethod: ApiRequest.GET, outType: Item.self) { response, errorMessage  in
            if let response = response {
                print(response)
            } else {
                if let errorMessage = errorMessage {
                    print("\(errorMessage.title) - \(errorMessage.body)")
                }
            }
        }
        
    }


}


