//
//  ProfileViewController.swift
//  spendsterIOS
//
//  Created by Dmytro Holovko on 5/2/19.
//  Copyright © 2019 KeyToTech. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet weak var scroller: UIScrollView!
    @IBOutlet weak var profileImage: CornerImage!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var email: UILabel!
    let defaults = UserDefaults.standard
    
    @IBAction func logoutButtonPressed(_ sender: Any) {
        defaults.removeObject(forKey: "username")
        defaults.removeObject(forKey: "email")
        defaults.removeObject(forKey: "profileImage")
        defaults.set(false, forKey: "alreadyLoggedIn")
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let usernameText = defaults.value(forKey: "username") as? String {
            self.username.text = usernameText
        }

        if let emailText = defaults.value(forKey: "email") as? String {
            self.email.text = emailText
        }

        if let imageData = defaults.value(forKey: "profileImage") as? Data {
            self.profileImage.image = UIImage(data: imageData)
        }
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewWillLayoutSubviews()
        scroller.contentSize.height = 920
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
