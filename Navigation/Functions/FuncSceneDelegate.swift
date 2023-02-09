//
//  CreateAnything.swift
//  Navigation_1
//
//  Created by Лариса Терегулова on 17.12.2022.
//

import UIKit

extension SceneDelegate {
    func createTabBarController() -> UITabBarController {
        let tabBarController = UITabBarController()
        UITabBar.appearance().backgroundColor = .systemGray4
        tabBarController.viewControllers = [createProfileViewController(), createFeedViewController()]
        return tabBarController
    } //Создаем таббар
    
    func createProfileViewController() -> UINavigationController {
        let profileViewController = UINavigationController(rootViewController: ProfileViewController())
        profileViewController.title = "Профиль"
        profileViewController.tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(systemName: "person.circle"), tag: 0)
        return profileViewController
    } //Создаем страницу Профиля

    func createFeedViewController() -> UINavigationController {
        let feedViewController = UINavigationController(rootViewController: FeedViewController())
        feedViewController.title = "Лента"
        feedViewController.tabBarItem = UITabBarItem(title: "Лента", image: UIImage(systemName: "text.justify"), tag: 1)
        return feedViewController
    } //Создаем Страницу Ленты
}

