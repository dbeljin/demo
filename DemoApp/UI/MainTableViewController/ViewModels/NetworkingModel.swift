//
//  NetworkingModel.swift
//  DemoApp
//
//  Created by Dusan Beljin on 17.3.25..
//

class NetworkingModel: NetworkingProtocol {
    private let url = "https://run.mocky.io/v3/9b27a9ff-886d-42b6-9501-950e1fd1598b"
    private let url2 = "https://run.mocky.io/v3/75cf65bc-9438-419a-a7bb-57d4d759e029"
    func fetchData(completion: @escaping (Item?, ErrorMessage?) -> Void) {
        ApiRequest.request(fromUrl: url2, httpMethod: ApiRequest.GET, outType: Item.self)
        { response, errorMessage  in
            completion(response, errorMessage)
        }
    }
}
