//
//  LoginViewModel.swift
//  L-TestTech
//
//  Created by Олеся on 25.10.2023.
//

import UIKit

struct LoginViewModel {
    private var presenter: LoginPresenterProtocol?
    let logo = UIImage(named: "L-TechLogo")
    let buttonActiveColor = UIColor(red: 23/255, green: 112/255, blue: 235/255, alpha: 1)
    let buttonDisableColor = UIColor(red: 185/255, green: 212/255, blue: 249/255, alpha: 1)
    let buttonTitle = "Войти"
    let buttonCornerRadius: CGFloat = Constants.buttonCornerRadius
    let textFieldCornerRadius: CGFloat = Constants.textFieldCornerRadius
    let labelInset: CGFloat = (Constants.inset56 * 2) + Constants.inset4
    let inset16 = Constants.inset16
    let heightButton = Constants.inset56 - 2
    let heightTextField = Constants.inset44
    let buttonFont = UIFont.systemFont(ofSize: 17)
    let labelFont = UIFont.boldSystemFont(ofSize: 20)
    let labelTextFieldsFont = UIFont.systemFont(ofSize: 17, weight: .semibold)
    let backgroundColor = UIColor(ciColor: .white)
    let titleLabelText = "Вход в аккаунт"
    let phoneNumberLabelText = "Телефон"
    let passwordNumberLabelText = "Пароль"
    let placeholderPasswordTextField = "Введите пароль"
    let openEye =  UIImage(named: "openEye")
    let closeEye =  UIImage(named: "closeEye")
//    var mask: String = ""
////    возможно нужен будет метод, который возвращает стринг, как тот что ниже
////    var mask: String = formattedNumber(<#T##self: LoginViewModel##LoginViewModel#>)
//    //    let closeEye = UIImageView(image: UIImage(named: "closeEye"))
////WE HAVE TO GET THE MASKKKK
//
//    //    init(presenter: LoginPresenterProtocol) {
//    //        self.presenter = LoginPresenter()
//    //    }
//    //  private (set)  var phoneMask: String?
//    //    var phoneMask: String  {
//    //        presenter.updateTextField(with: <#T##String#>)
//    //    }
//    //}

    func formattedNumber(number: String) -> String {
        let cleanPhoneNumber = number.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
//        (вот тут то ли маску надо указать которая пришла-number то лине пойму что есть пример в статейном  приимере)
        let mask = number
        var result = ""
        var index = cleanPhoneNumber.startIndex
        for ch in mask where index < cleanPhoneNumber.endIndex {
            if ch == "#" {
                result.append(cleanPhoneNumber[index])
                index = cleanPhoneNumber.index(after: index)
            } else {
                result.append(ch)
            }
        }
        return result
    }
}
