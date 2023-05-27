//
//  MainViewController.swift
//  Bankey
//
//  Created by Alex Provarenko on 26.05.2023.
//

import UIKit

class MainViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupBar()
    }
    
    private func setupViews() {
        let summaryVC = AccountSummaryViewController()
        let moneyVC = MoveMoneyViewController()
        let moreVC = MoreViewController()
        
        summaryVC.setTapBarImage(imageName: "list.dash.header.rectangle", title: "Summyry")
        moneyVC.setTapBarImage(imageName: "arrow.left.arrow.right", title: "Move Money")
        moreVC.setTapBarImage(imageName: "ellipsis.circle", title: "More")
       
        let summaryNavController = UINavigationController(rootViewController: summaryVC)
        let moneyNavController = UINavigationController(rootViewController: moneyVC)
        let moreNavContoller = UINavigationController(rootViewController: moreVC)

        summaryVC.navigationController?.navigationBar.barTintColor = appColor
        hideNavigationBarLine(summaryNavController.navigationBar)
        
        let tapBarList = [summaryNavController, moneyNavController, moreNavContoller]
        
        viewControllers = tapBarList
    }
    
    private func hideNavigationBarLine(_ navigationBar: UINavigationBar) {
        let image = UIImage()
        navigationBar.shadowImage = image
        navigationBar.setBackgroundImage(image, for: .default)
        navigationBar.isTranslucent = false
    }
    
    private func setupBar() {
        tabBar.tintColor = appColor
        tabBar.isTranslucent = false
    }
}
