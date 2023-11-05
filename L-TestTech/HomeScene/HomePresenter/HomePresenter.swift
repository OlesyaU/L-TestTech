//
//  HomePresenter.swift
//  L-TestTech
//
//  Created by Олеся on 03.11.2023.
//

import Foundation
import UIKit

protocol HomePresenterProtocol {
    func showArticles(articles: [Article])
    
}


final class HomePresenter {
    private var homeViewController: HomeViewControllerProtocol?



}
extension HomePresenter: HomePresenterProtocol {
    func showArticles(articles: [Article]) {
        let viewModel = HomeViewModel()
//        loginVC.navigationController?.pushViewController(homeViewController, animated: true)
        homeViewController?.showArticles(articles: articles)
        print("home presenter \(articles.count), \(homeViewController)")
    }

   


}
