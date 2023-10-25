//
//  ViewController.swift
//  L-TestTech
//
//  Created by Олеся on 25.10.2023.
//
import SnapKit
import UIKit

class LoginViewController: UIViewController {

    private var viewModel: LoginViewModel?

    private lazy var logo: UIImageView = {
        let image = UIImageView(image: viewModel?.logo)
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = LoginViewModel()
        layout()
    }

    private func layout() {
        [logo].forEach({view.addSubview($0)})
        logo.snp.makeConstraints { maker in
            maker.top.equalToSuperview().inset(56)
            maker.centerX.equalToSuperview()
        }


    }

}

