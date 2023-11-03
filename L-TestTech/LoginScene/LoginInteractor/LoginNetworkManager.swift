//
//  LoginNetworkManager.swift
//  L-TestTech
//
//  Created by Олеся on 26.10.2023.
//

import Foundation
import Alamofire


protocol LoginNetworkManagerProtocol {
    func getPhoneMask(_ url: String, handler: @escaping(_ dataFromApi: String?)-> Void)
    func checkUser(phone: String, password: String, handler: @escaping(_ dataFromServer: Bool?)-> Void)
}


final class LoginNetworkManager: LoginNetworkManagerProtocol {
    static let sharedInstance = LoginNetworkManager()

  func getPhoneMask(_ url: String, handler: @escaping(_ dataFromApi: String?)-> Void) {
      AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default)
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
    func checkUser(phone: String, password: String, handler: @escaping(_ dataFromServer: Bool?)-> Void){
 let parameters: [String: String] = [
            "phone" : phone,
            "password" : password
        ]
        let headers: HTTPHeaders = [
            "Content-Type": "application/x-www-form-urlencoded"
        ]
        let url = "http://dev-exam.l-tech.ru/api/v1/auth"

        AF.request(url, method: .post, parameters: parameters, headers: headers).responseData { response  in

            debugPrint(response)


        }
    }

}
