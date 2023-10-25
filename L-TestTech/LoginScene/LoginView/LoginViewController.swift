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

    private lazy var labelPhone: UILabel = {
        let label = UILabel()
        label.text = viewModel.phoneNumberLabelText
        label.font = viewModel.labelTextFieldsFont
        return label
    }()

    private lazy var labelPassword: UILabel = {
        let label = UILabel()
        label.text = viewModel.passwordNumberLabelText
        label.font = viewModel.labelTextFieldsFont
        return label
    }()

    private lazy var phoneTextField: UITextField = {
        let textField = UITextField()
        textField.delegate = self
        textField.clearButtonMode = .always
        textField.placeholder = "mask"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .phonePad
        return textField
    }()

    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.delegate = self
        textField.clearButtonMode = .whileEditing
        textField.placeholder = viewModel.placeholderPasswordTextField
        textField.borderStyle = .roundedRect
//        textField.leftViewRect(forBounds: CGRect(origin: <#T##CGPoint#>, size: <#T##CGSize#>))
//        textField.leftView = 
        textField.leftViewMode = .always
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
        [logo,label,labelPhone, phoneTextField, labelPassword, passwordTextField, signInButton,].forEach({view.addSubview($0)})

        logo.snp.makeConstraints { maker in
            maker.top.equalToSuperview().inset(56)
            maker.centerX.equalToSuperview()
        }

        label.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview()
            maker.top.equalToSuperview().inset(viewModel.labelInset)
        }

        labelPhone.snp.makeConstraints { maker in
            maker.top.equalTo(label).inset(viewModel.labelInset)
            maker.left.equalToSuperview().inset(viewModel.inset16)
        }

        phoneTextField.snp.makeConstraints { maker in
            maker.top.equalTo(labelPhone.snp.bottom)
            maker.left.right.equalToSuperview().inset(viewModel.inset16)
            maker.height.equalTo(viewModel.heightTextField)
        }

        labelPassword.snp.makeConstraints { maker in
            maker.top.equalTo(phoneTextField.snp.bottom).inset(-viewModel.inset16)
            maker.left.equalToSuperview().inset(viewModel.inset16)
        }

        passwordTextField.snp.makeConstraints { maker in
            maker.top.equalTo(labelPassword.snp.bottom)
            maker.left.right.equalToSuperview().inset(viewModel.inset16)
            maker.height.equalTo(viewModel.heightTextField)
        }

        signInButton.snp.makeConstraints { maker in
            maker.top.equalTo(phoneTextField.snp.bottom).inset(-viewModel.labelInset)
            maker.left.right.equalToSuperview().inset(viewModel.inset16)
            maker.height.equalTo(viewModel.heightButton)
        }
    }
}

extension LoginViewController: UITextFieldDelegate {
    // маску берем и накладываем при загрузке на поле с номером
}
