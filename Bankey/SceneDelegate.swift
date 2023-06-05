//
//  SceneDelegate.swift
//  Bankey
//
//  Created by Alex Provarenko on 16.05.2023.
//

import UIKit

let appColor: UIColor = .systemTeal

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?

    let loginVC  = LoginViewController()
    let onboardingContainerViewController = OnboardingContainerViewController()
    let mainVC = MainViewController()
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.backgroundColor = .systemBackground
        window?.makeKeyAndVisible()
        
        loginVC.delegate = self
        onboardingContainerViewController.delegate = self
        
        let mainVC = mainVC
        mainVC.setStatusBar()

        UINavigationBar.appearance().isTranslucent = true
        UINavigationBar.appearance().backgroundColor = appColor
        
        window?.rootViewController = mainVC
        
    }
}

extension SceneDelegate {
    func setRotViewController(_ vc: UIViewController, animated: Bool = true) {
        guard animated, let window = self.window else {
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
            return
        }
        
        window.rootViewController = vc
        window.makeKeyAndVisible()
        UIView.transition(with: window, duration: 0.3,
                          options: .transitionCrossDissolve,
                          animations: nil)
    }
}

extension SceneDelegate: LoginViewControllerDelegate {
    func didLogin() {
        if LocalState.hasOnboarded {
            setRotViewController(mainVC)
        } else {
            setRotViewController(onboardingContainerViewController)
        }
    }
}

extension SceneDelegate: OnboardingContainerViewControllerDelegate {
    func didFinishOnboarding() {
        LocalState.hasOnboarded = true
        setRotViewController(mainVC)
    }
}

extension SceneDelegate: LogoutDelegte {
    func didLogout() {
        setRotViewController(loginVC)
    }
}
