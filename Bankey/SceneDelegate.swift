//
//  SceneDelegate.swift
//  Bankey
//
//  Created by Alex Provarenko on 16.05.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    let loginVC  = LoginViewController()
    let onboardingContainerViewController = OnboardingContainerViewController()
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.backgroundColor = .systemBackground

        loginVC.delegate = self
        onboardingContainerViewController.delegate = self
        
        window?.rootViewController = onboardingContainerViewController
        window?.makeKeyAndVisible()
    }
}

extension SceneDelegate: LoginViewControllerDelegate {
    func didLogin() {
        print("Did login")
    }
}

extension SceneDelegate: OnboardingContainerViewControllerDelegate {
    func didFinishOnboarding() {
        print("Did onboard")
    }
}
