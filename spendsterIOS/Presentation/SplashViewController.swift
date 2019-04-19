//
//  LoginScreenViewController.swift
//  spendsterIOS
//
//  Created by Dmytro Holovko on 3/15/19.
//  Copyright © 2019 KeyToTech. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadingIndecator.startAnimating()
    }
    
    @IBOutlet weak var loadingIndecator: UIActivityIndicatorView!
    
    override func viewDidAppear(_ animated: Bool) {
        
        if self.shouldShowOnboarding() {
            self.presentOnboarding()
        } else {
            self.presentHomeScreen()
        }
    }
    
    func presentNavigationController(with controller: UIViewController,
                                     animated: Bool = true,
                                     completion: (() -> Void)? = nil) {
        let navigationController = UINavigationController.init(rootViewController: controller)
        navigationController.isNavigationBarHidden = true
        self.present(navigationController, animated: animated, completion: completion)
    }
    
    func shouldShowOnboarding() -> Bool {
        return !UserDefaults.standard.bool(forKey: "alreadyLoggedIn")
    }
    
    func presentHomeScreen() {
        let storyboard = UIStoryboard(name: "HomeScreen", bundle: nil)
        if let homeScreenViewController = storyboard.instantiateViewController(withIdentifier: "HomeScreenViewController") as? HomeScreenViewController {
            self.presentNavigationController(with: homeScreenViewController)
        }
    }
    
    func presentOnboarding() {
        let storyboard = UIStoryboard(name: "WelcomeScreen", bundle: nil)
        if let walkthroughViewController = storyboard.instantiateViewController(withIdentifier: "WalkthroughViewController") as? WalkthroughViewController {
            self.presentNavigationController(with: walkthroughViewController)
        }
    }
}
