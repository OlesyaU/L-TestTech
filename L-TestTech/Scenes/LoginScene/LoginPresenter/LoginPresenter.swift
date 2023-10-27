//
//  LoginPresenter.swift
//  L-TestTech
//
//  Created by Олеся on 26.10.2023.
//

import Foundation

protocol LoginPresenterProtocol {
    func updateTextField()
}


final class LoginPresenter {
    private var loginViewModel = LoginViewModel()

}
extension LoginPresenter: LoginPresenterProtocol {
    func updateTextField() {
        LoginNetworkManager.sharedInstance.fetchAPIData { dataFromApi in
//            loginViewModel.phoneMask = dataFromApi
//           dataFromApi
            print(dataFromApi)
        }
    }


}
