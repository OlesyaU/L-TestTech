//
//  LoginPresenter.swift
//  L-TestTech
//
//  Created by Олеся on 26.10.2023.
//

import Foundation

protocol LoginPresenterProtocol {
//    это строка - маска
    func updateTextField(response: String)
}

final class LoginPresenter {
    weak var loginViewContrroller: LoginSceneDisplayProtocol?

}
extension LoginPresenter: LoginPresenterProtocol {

    func updateTextField(response: String) {
        var viewModel =  LoginViewModel()
//        viewModel.mask = response
//        viewModel.mask = response
        print("func updateTextField(response: String)  from presenter - response - \(response), vi")
//        loginViewContrroller?.displayUser(viewModel: viewModel)
        loginViewContrroller?.displayMask(mask: response)
    }


}
//import Foundation
//
//protocol CleanScenePresentationLogic: AnyObject {
//    func presentSomething(response: CleanSceneModels.Something.Response)
//}

//class CleanScenePresenter {
//    weak var viewController: CleanSceneDisplayLogic?
//}
//
//// MARK: - Presentation Logic Functions
//extension CleanScenePresenter: CleanScenePresentationLogic {
//    // MARK: Present something
//    func presentSomething(response: CleanSceneModels.Something.Response) {
//        let viewModel = CleanSceneModels.Something.ViewModel() // make viewModel from response
//        viewController?.displaySomething(viewModel: viewModel)
//    }
//}
