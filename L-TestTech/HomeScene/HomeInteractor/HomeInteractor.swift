//
//  HomeInteractor.swift
//  L-TestTech
//
//  Created by Олеся on 03.11.2023.
//

import Foundation
protocol HomeInteractorProtocol {
    func getArticles(url: String)
}
final class HomeInteractor {
    private var presenter: HomePresenterProtocol?
}
extension HomeInteractor: HomeInteractorProtocol {
    func getArticles(url: String) {
        HomeNetworkManager.sharedInstance.getArticles(url) { [weak self] articles in
            print(articles)
            self?.presenter?.showArticles(articles: articles)
        }
    }


}
