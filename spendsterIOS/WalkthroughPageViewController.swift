//
//  WalkthroughPageViewController.swift
//  spendsterIOS
//
//  Created by Dmytro Holovko on 3/22/19.
//  Copyright © 2019 KeyToTech. All rights reserved.
//

import UIKit
protocol WalkthroughPageViewControllerDelegate: class {
    func didUpdatePageIndex(currentIndex: Int)
}

class WalkthroughPageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    weak var walkthroughDelegate: WalkthroughPageViewControllerDelegate?
    let pageSubheadings = ["Welcome to Budget Planner", "Save money with ease", ""]
    let pageText = ["Take control of your money\nand save them by tracking your expenses", "Easily create budgets, and see our\nsuggestions based on your spending", "Take control of your money\nand save them by tracking your expenses."]
    let pageImages = ["Illustration", "hand-pork", "illustration-3"]
    var currentIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // set data source and deligate to self
        dataSource = self
        delegate = self
        //create first walkthrough screen
        if let startingViewController = contentViewController(at: 0) {
            setViewControllers([startingViewController], direction: .forward, animated: true, completion: nil )
        }
    }
    // swiftlint:disable force_cast
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! WalkthroughContentViewController).index
        index -= 1
        return contentViewController(at: index)
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! WalkthroughContentViewController).index
        index += 1

        return contentViewController(at: index)
    }
    func lastPage() {
        for _ in self.currentIndex...pageText.count-2 {
            self.forwardPage()
        }
    }
    // swiftlint:enable force_cast
    func contentViewController(at index: Int) -> WalkthroughContentViewController? {
        if index < 0 || index > pageText.count-1 {
            return nil
        }
        //create new controller and pass siatible data
        let storyboard = UIStoryboard(name: "WelcomeScreen", bundle: nil)
        if let pageContentViewController = storyboard.instantiateViewController(withIdentifier: "WalkthroughContentViewController") as? WalkthroughContentViewController {
            pageContentViewController.subheading = pageSubheadings[index]
            pageContentViewController.imageName = pageImages[index]
            pageContentViewController.contentText = pageText[index]
            pageContentViewController.index = index
            return pageContentViewController
        }
        return nil
    }

    func forwardPage() {
        currentIndex += 1
        if let nextViewController = contentViewController(at: currentIndex) {
            setViewControllers([nextViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed {
            if let contentViewController = pageViewController.viewControllers?.first as? WalkthroughContentViewController {
                currentIndex = contentViewController.index
                walkthroughDelegate?.didUpdatePageIndex(currentIndex: currentIndex)
            }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
