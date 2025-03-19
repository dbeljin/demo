//
//  NetworkingModel.swift
//  DemoApp
//
//  Created by Dusan Beljin on 17.3.25..
//

class NetworkingModel: NetworkingProtocol {

    func fetchData(completion: @escaping (Item?, ErrorMessage?) -> Void) {
        ApiRequest.request(fromUrl: Constants.apiUrl, httpMethod: ApiRequest.GET, outType: Item.self)
        { [weak self] response, errorMessage in
            guard let response else {
                completion(nil, errorMessage)
                return
            }
            self?.saveData(response)
            completion(response, errorMessage)
        }
    }
    
    @discardableResult
    func saveData<T: Codable>(_ data: T) -> Bool {
        DataUtil().saveResponseIntoFile(filename: Constants.itemResponseFileName, response: data)
    }
    
    func loadData<T: Codable>(_ type: T.Type) -> T? {
        DataUtil().getItemResponse() as? T
    }
}
