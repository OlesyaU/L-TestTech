//
//  HomeViewController.swift
//  L-TestTech
//
//  Created by Олеся on 25.10.2023.
//

import UIKit
import SnapKit

protocol HomeViewControllerProtocol {
    func showArticles(articles: [Article])
}

final class HomeViewController: UIViewController {

    private var interactor: HomeInteractorProtocol?
    private var articles = [Article]()
    private let viewModel = HomeViewModel()
    private let tableView: UITableView = {
        let table = UITableView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height), style: .plain)
        table.backgroundColor = .red
        return table
    }()
    
    private let tabBar: UITabBarController = {
        let bar = UITabBarController()
        return bar
    }()



    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(tableView)
        title = viewModel.title
        setItems()
    }
}
extension HomeViewController : HomeViewControllerProtocol {
    func showArticles(articles: [Article]) {
        self.articles = articles
    }
}

extension HomeViewController {
    private func setItems() {
        let navBar = self.navigationController?.navigationBar
        let standardAppearance = UINavigationBarAppearance()
        standardAppearance.configureWithOpaqueBackground()
        let compactAppearance = standardAppearance.copy()
        navBar?.standardAppearance = standardAppearance
        navBar?.scrollEdgeAppearance = standardAppearance
        navBar?.compactAppearance = compactAppearance

        navigationItem.rightBarButtonItem = UIBarButtonItem(image: viewModel.navigationItem, style: .plain, target: self, action: #selector(refreshNews))
    }
    @objc private func refreshNews() {

    }
}
