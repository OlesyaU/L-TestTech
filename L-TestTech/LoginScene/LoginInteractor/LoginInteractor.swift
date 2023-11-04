//
//  LoginInteractor.swift
//  L-TestTech
//
//  Created by Олеся on 27.10.2023.
//

import Foundation
protocol LoginBusinessLogic {
    func getPhoneMask(request: String)
    func getUserData(phone: String, password: String)

}

protocol LoginDataStoreProtocol {

}

final class LoginInteractor: LoginDataStoreProtocol {

    var presenter: LoginPresenterProtocol?
}

extension LoginInteractor: LoginBusinessLogic {

    func getPhoneMask(request: String) {
        LoginNetworkManager.sharedInstance.getPhoneMask(request) { dataFromApi in
            guard let dataFromApi else {return}
            print(dataFromApi)
            self.presenter?.updateTextField(response: dataFromApi)
        }

        func getUserData(phone: String, password: String) {
            LoginNetworkManager.sharedInstance.checkUser(phone: phone, password: password, handler: { [weak self] success in
                guard let success else {return}
                self?.presenter?.checkUser(isKnown: success)
            })
        }
    }

}
