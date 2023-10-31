//
//  ViewController.swift
//  L-TestTech
//
//  Created by Олеся on 25.10.2023.
//
import SnapKit
import UIKit
/// Протокол логики для отображения подготовленной информации
protocol LoginSceneDisplayProtocol: AnyObject {

    func displayMask(mask: String)
    //    func displayUser(viewModel: LoginViewModel)
}

final class LoginViewController: UIViewController {
    
    var viewModel = LoginViewModel()

    private var interactor: (LoginBusinessLogic & LoginDataStoreProtocol)?
    private var mask = ""
    private var preMask = ""
    private var phoneNumber = ""
    private var password = ""
    
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
                textField.tag = 0
        textField.delegate = self
        textField.clearButtonMode = .always
        textField.borderStyle = .roundedRect
        textField.keyboardType = .phonePad
        textField.clearsOnBeginEditing = false
        return textField
    }()

    private lazy var eyeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(viewModel.openEye, for: .normal)
        button.addTarget(self, action: #selector(eyeToggle), for: .touchUpInside)
        return button
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
                textField.tag = 1
        textField.delegate = self
        textField.clearButtonMode = .whileEditing
        textField.placeholder = viewModel.placeholderPasswordTextField
        textField.borderStyle = .roundedRect
        textField.rightViewMode = .always
        textField.rightView = eyeButton
        textField.passwordRules = UITextInputPasswordRules(descriptor: "required: upper; required: lower; required: digit; max-consecutive: 2; minlength: 9;")
        textField.isSecureTextEntry = true
        return textField
    }()

    private lazy var signInButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = viewModel.buttonDisableColor
        button.setTitle(viewModel.buttonTitle, for: .normal)
        button.layer.cornerRadius = viewModel.buttonCornerRadius
        button.titleLabel?.font = viewModel.buttonFont
        button.tintColor = .white
        button.addTarget(self, action: #selector(signInButtonTapped),
                         for: .touchUpInside)
        return button
    }()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    /// Метод для стартовой настройки компонентов сцены
    private func setup() {

        // Создаем компоненты VIP цикла
        let interactor = LoginInteractor()
        let presenter = LoginPresenter()

        // Связываем созданные компоненты
        interactor.presenter = presenter
        presenter.loginViewContrroller = self

        // Указываем ссылку на Interactor для View Controller
        self.interactor = interactor
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = viewModel.backgroundColor
        layout()
    }

    private func loadMask() {
        let requst = "http://dev-exam.l-tech.ru/api/v1/phone_masks"
        interactor?.getPhoneMask(request: requst)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        //        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardDidHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardDidShowNotification , object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardDidHideNotification , object: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        UIButton.animate(withDuration: 0.3) {
            self.signInButton.snp.updateConstraints({ maker in
                maker.bottom.equalToSuperview().inset(self.viewModel.labelInset)
            })
            self.view.layoutIfNeeded()
            self.view.endEditing(true)
        }
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
            maker.top.equalTo(phoneTextField.snp.bottom).inset(-(viewModel.inset16))
            maker.left.equalToSuperview().inset(viewModel.inset16)
        }
        
        passwordTextField.snp.makeConstraints { maker in
            maker.top.equalTo(labelPassword.snp.bottom)
            maker.left.right.equalToSuperview().inset(viewModel.inset16)
            maker.height.equalTo(viewModel.heightTextField)
        }
        
        signInButton.snp.makeConstraints { maker in
            maker.left.right.equalToSuperview().inset(viewModel.inset16)
            maker.height.equalTo(viewModel.heightButton)
            maker.bottom.equalToSuperview().inset(viewModel.labelInset)
        }
    }
    
    @objc private func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            UIButton.animate(withDuration: 0.3) {
                self.signInButton.snp.updateConstraints({ maker in
                    let bottomButton = (self.viewModel.inset16) + keyboardSize.height
                    maker.bottom.equalToSuperview().inset(bottomButton)
                })
            }
            self.view.layoutIfNeeded()
        }
    }
    
    //    @objc private func keyboardWillHide(notification: NSNotification) {
    
    //    }

    @objc func eyeToggle() {
        passwordTextField.isSecureTextEntry.toggle()
        print(passwordTextField.isSecureTextEntry)
        switch passwordTextField.isSecureTextEntry {
            case true:
                eyeButton.setBackgroundImage(viewModel.closeEye, for: .normal)
            case false:
                eyeButton.setBackgroundImage(viewModel.openEye, for: .normal)
//                print(passwordTextField.text)
        }
    }

    @objc private func signInButtonTapped() {
        UIButton.animate(withDuration: 0.3) {
            self.signInButton.snp.updateConstraints({ maker in
                maker.bottom.equalToSuperview().inset(self.viewModel.labelInset)
            })
            self.view.layoutIfNeeded()
            self.view.endEditing(true)
        }
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string:  String) -> Bool {
        let maskNew = mask.replacingOccurrences(of:"[^//s*?/(?/)?(A-Z)*-]", with: "#", options: .regularExpression, range: nil)
        let componentsBetweenDashCount = maskNew.components(separatedBy: "-").count
        let hasBrackets = maskNew.contains { $0 == ")" }
        guard let text = phoneTextField.text?.replacingOccurrences(of: preMask, with: "") else {
            return false
        }
        let newText = text.applyPatternOnNumbers(pattern: maskNew, replacementCharacter: "#")

        //newLength for masks with brackets +375 and +44
        var newLength = newText.count + preMask.count - (componentsBetweenDashCount + 1)
        // newLength for mask with brackets
        if hasBrackets {
            newLength  -= 1
        } else if !hasBrackets, preMask == "+7" {
            //newLenght for mask without
            newLength = newText.count + preMask.count - componentsBetweenDashCount
        }

        switch textField.tag {
            case 0 :
                textField.text = preMask + " " + newText
                if newLength == 11 {
               phoneNumber = getPhone(phone: textField.text!)
                }
                return newLength <= 10 || string.isEmpty

            case 1:

//          TODO: add settings the field 
                return true
            default:
                return false
        }
    }
    func getPhone(phone: String) -> String {
     let nm = phone.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        print(nm)
return nm
    }
    private func checkPhoneNumber(phoneNumber: String) ->Bool {
return true
    }
    private func checkPassword(password: String) ->Bool {
return true
    }
}
extension LoginViewController: LoginSceneDisplayProtocol {
    func displayUser(viewModel: LoginViewModel) {
        self.viewModel = viewModel
    }

    func displayMask(mask: String) {
        var mutMask = mask.components(separatedBy: " ").dropFirst().joined()
        preMask = mask.components(separatedBy: " ").first ?? "+0"
        phoneTextField.text = preMask
        self.mask = mutMask
    }

    func fetchMask() {
        let request =  "http://dev-exam.l-tech.ru/api/v1/phone_masks"
        interactor?.getPhoneMask(request: request)
    }
}
