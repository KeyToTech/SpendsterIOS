//
//  ProfileViewController.swift
//  spendsterIOS
//
//  Created by Dmytro Holovko on 5/2/19.
//  Copyright © 2019 KeyToTech. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, ProfileView {

    private var presenter: ProfilePresenter?
    @IBOutlet weak var scroller: UIScrollView!
    @IBOutlet weak var profileImage: CornerImage!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBAction func logoutButtonPressed(_ sender: Any) {
        self.presenter?.makeLogout()
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        self.presenter = ProfilePresenter.init(view: self, storage: UserDefaultsStorage())
        self.presenter?.updeteProfile()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewWillLayoutSubviews()
        scroller.contentSize.height = 920
    }
    
    func bindUsername(username: String) {
        self.username.text = username
    }
    
    func bindEmail(email: String) {
        self.email.text = email
    }
    
    func bindImage(imageData: Data) {
        self.profileImage.image = UIImage(data: imageData)
    }
    
}
