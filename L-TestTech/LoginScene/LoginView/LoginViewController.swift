//
//  ViewController.swift
//  L-TestTech
//
//  Created by Олеся on 25.10.2023.
//
import SnapKit
import UIKit

class LoginViewController: UIViewController {

    private var viewModel = LoginViewModel()

    private lazy var logo: UIImageView = {
        let image = UIImageView(image: viewModel.logo)
        return image
    }()
    private lazy var label: UILabel = {
let label = UILabel()
        label.text = viewModel.titleLabelText
        label.font = viewModel.labelFont
        return label
    }()

    private lazy var phoneTextField: UITextField = {
        let textField = UITextField()
        textField.delegate = self
        textField.clearButtonMode = .whileEditing
        textField.placeholder = "mask"
        textField.borderStyle = .roundedRect
return textField
    }()
    private lazy var signInButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = viewModel.buttonDisableColor
        button.setTitle(viewModel.buttonTitle, for: .normal)
        button.layer.cornerRadius = viewModel.buttonCornerRadius
        button.titleLabel?.font = viewModel.buttonFont
        button.tintColor = .white
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = viewModel.backgroundColor
        layout()
    }

    private func layout() {
        [logo,label,  phoneTextField, signInButton,].forEach({view.addSubview($0)})
        logo.snp.makeConstraints { maker in
            maker.top.equalToSuperview().inset(56)
            maker.centerX.equalToSuperview()

        }
        label.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview()
            maker.top.equalToSuperview().inset(viewModel.labelInset)
        }

        phoneTextField.snp.makeConstraints { maker in
            maker.top.equalTo(label).inset(viewModel.labelInset)
            maker.left.right.equalToSuperview().inset(viewModel.inset16)
        }




        signInButton.snp.makeConstraints { maker in
//            maker.centerX.equalToSuperview()
            maker.top.equalTo(phoneTextField).inset(100)
            maker.left.right.equalToSuperview().inset(viewModel.inset16)
//            maker.height.
        }

    }

}

extension LoginViewController: UITextFieldDelegate {
// маску берем и накладываем при загрузке на поле с номером
}
