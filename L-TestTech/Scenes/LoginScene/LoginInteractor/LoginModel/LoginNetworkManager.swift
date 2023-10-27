//
//  LoginNetworkManager.swift
//  L-TestTech
//
//  Created by Олеся on 26.10.2023.
//

import Foundation
import Alamofire
// Это сам Interactor пока 
final class LoginNetworkManager {
    
    static let sharedInstance = LoginNetworkManager()
    func fetchAPIData(handler: @escaping(_ dataFromApi: String?)-> Void) {
      let url = "http://dev-exam.l-tech.ru/api/v1/phone_masks"
      AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil)
        .response{ resp in
            switch resp.result{
              case .success(let data):
                do{
                  let jsonData = try JSONDecoder().decode(PhoneMask.self, from: data!)
                    print(jsonData.phoneMask.count)
                    handler(jsonData.phoneMask)
               } catch {
                  print(error.localizedDescription)
               }
             case .failure(let error):
               print(error.localizedDescription)
             }
        }
   }
}
