//
//  HomeTabBarController.swift
//  L-TestTech
//
//  Created by Олеся on 05.11.2023.
//

import UIKit

class HomeTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let home = UINavigationController(rootViewController: HomeViewController())
        let favorites = UINavigationController(rootViewController: FavoritesViewController())
        let account = UINavigationController(rootViewController: AccountViewController())
        viewControllers = [home,favorites,account]
        home.tabBarItem = UITabBarItem(title: "Лента новостей", image: UIImage(named: "icon_home"), tag: 1)
        favorites.tabBarItem = UITabBarItem(title: "Избранное", image: UIImage(named: "icon_heart"), tag: 2)
        account.tabBarItem = UITabBarItem(title: "Аккаунт", image: UIImage(named: "icon_user"), tag: 3)
        UITabBar.appearance().backgroundColor = .secondarySystemBackground
    }
}
