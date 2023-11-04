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
    func checkUser(isKnown: Bool)
}

final class LoginPresenter {
    weak var loginViewContrroller: LoginSceneDisplayProtocol?

}

extension LoginPresenter: LoginPresenterProtocol {
    func checkUser(isKnown: Bool) {
        loginViewContrroller?.isKnownUser(isKnown: isKnown)
    }

    func updateTextField(response: String) {
        loginViewContrroller?.displayMask(mask: response)
    }
}
