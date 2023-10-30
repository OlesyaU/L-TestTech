//
//  LoginInteractor.swift
//  L-TestTech
//
//  Created by Олеся on 27.10.2023.
//

import Foundation
protocol LoginBusinessLogic {
    func getPhoneMask(request: String)

}

protocol LoginDataStoreProtocol {       // To store or pass data

    var phone: String { get set }
    var password: String { get set }
}

final class LoginInteractor: LoginDataStoreProtocol {
    var phone: String = ""
    var password: String = ""
    var presenter: LoginPresenterProtocol?
//    var networkManager: LoginNetworkManagerProtocol?

}

extension LoginInteractor: LoginBusinessLogic {

    func getPhoneMask(request: String) {
//
//        networkManager?.getPhoneMask(request, handler: { dataFromApi in
//            guard let dataFromApi else {return}
////            презентер передает маску
//            print(dataFromApi)
//            self.presenter?.updateTextField(response: dataFromApi)
//        })
        LoginNetworkManager.sharedInstance.getPhoneMask(request) { dataFromApi in
            guard let dataFromApi else {return}
            print(dataFromApi)
            self.presenter?.updateTextField(response: dataFromApi)
        }

    }


}

// MARK: - Business Logic Functions
//extension CleanSceneInteractor: CleanSceneBusinessLogic {
//    // MARK: Do something
//    func doSomething(request: CleanSceneModels.Something.Request) {
//        worker?.doSomething() { someResponse in
//          presenter?.presentSomething(response: response)
//    }
//}
