//
//  LoginNetworkManager.swift
//  L-TestTech
//
//  Created by Олеся on 26.10.2023.
//

import Foundation
import Alamofire
// Это сам Interactor пока

protocol LoginNetworkManagerProtocol {
    func getPhoneMask(_ url: String, handler: @escaping(_ dataFromApi: String?)-> Void)
}


final class LoginNetworkManager: LoginNetworkManagerProtocol {

    static let sharedInstance = LoginNetworkManager()

    func getPhoneMask(_ url: String, handler: @escaping(_ dataFromApi: String?)-> Void) {
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
//class CleanSceneDoingSomethingWorker: CleanSceneDoingSomethingWorkerLogic {
// let service: SomeNetworkServiceProtocol

// init(service: SomeNetworkServiceProtocol) {
//     self.service = service
// }

//    func doSomething(completionHandler: (CleanSceneModels.Something.Response) -> Void) {
// service.doSomething()
//    }
//
//}
