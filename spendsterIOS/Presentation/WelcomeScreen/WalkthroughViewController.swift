//
//  WalkthroughViewController.swift
//  spendsterIOS
//
//  Created by Dmytro Holovko on 3/22/19.
//  Copyright © 2019 KeyToTech. All rights reserved.
//

import UIKit

class WalkthroughViewController: UIViewController, WalkthroughPageViewControllerDelegate {
    var walkthroughPageViewController: WalkthroughPageViewController?

    @IBOutlet weak var signUpTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var signUpHeigthCinstraint: NSLayoutConstraint!
    @IBOutlet var nextButton: UIButton!
    @IBOutlet var skipButton: UIButton!
    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var signupStackView: UIStackView! {
        didSet {
            signupStackView.isHidden = true
        }
    }
    
    @IBAction func signUpButtonPressed(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Auth", bundle: nil)
        if let signUpViewController = storyboard.instantiateViewController(withIdentifier: "SignUpViewController") as? SignUpScreenViewController {
            present(signUpViewController, animated: true, completion: nil )
        }
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Auth", bundle: nil)
        if let loginScreenViewController = storyboard.instantiateViewController(withIdentifier: "LoginScreenViewController") as? LoginScreenViewController {
            present(loginScreenViewController, animated: true, completion: nil )
        }
    }
    
    @IBAction func nextButtonPressed (sender: UIButton) {
        if let index = walkthroughPageViewController?.currentIndex {
            switch index {
            case 0...1 :
                walkthroughPageViewController?.forwardPage()
            case 2 :
                dismiss(animated: true, completion: nil)
            default: break
            }
        }
        updateUI()
    }
    
    @IBAction func skipButtonPressed (sender: UIButton) {
        walkthroughPageViewController?.lastPage()
        updateUI()
    }
    
    func updateUI() {
        if let index = walkthroughPageViewController?.currentIndex {
            switch index {
            case 0...1 :
                hideSignUpBar()
            case 2 :
                showSignUpBar()
            default: break
            }
            pageControl.currentPage = index
        }
    }
    
    func didUpdatePageIndex(currentIndex: Int) {
        updateUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideSignUpBar()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination
        if let pageViewController = destination as? WalkthroughPageViewController {
            walkthroughPageViewController = pageViewController
            walkthroughPageViewController?.walkthroughDelegate = self
        }
    }
    
    func hideSignUpBar() {
        nextButton.isHidden = false
        skipButton.isHidden = false
        signupStackView.isHidden = true
        signUpHeigthCinstraint.constant = 16
        signUpTopConstraint.constant = 0
    }
    
    func showSignUpBar() {
        nextButton.isHidden = true
        skipButton.isHidden = true
        signupStackView.isHidden = false
        signUpHeigthCinstraint.constant = 116
        signUpTopConstraint.constant = 40
    }
    
}
