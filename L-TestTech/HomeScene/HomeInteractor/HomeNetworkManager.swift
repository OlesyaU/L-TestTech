//
//  HomeNetworkManager.swift
//  L-TestTech
//
//  Created by Олеся on 05.11.2023.
//

import Foundation
import Alamofire
protocol HomeNetworkManagerProtocol {
    func getArticles(_ url: String, handler: @escaping(_ articles: [Article])-> Void)
}
final class HomeNetworkManager {
    static let sharedInstance = HomeNetworkManager()
}
extension HomeNetworkManager: HomeNetworkManagerProtocol {
    func getArticles(_ url: String, handler: @escaping ([Article]) -> Void) {

        AF.request(url, method: .get).responseDecodable(of: [Article].self, completionHandler: { response in
            debugPrint(response)
            switch response.result {
                case .success(let data):

                    print(data)
                case .failure(let error):
                    print(error.localizedDescription)
            }
        })
    }
    
    
}
