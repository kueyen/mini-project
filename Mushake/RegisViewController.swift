//
//  RegisViewController.swift
//  Mushake
//
//  Created by pzpopori's mac air on 14/11/2561 BE.
//  Copyright © 2561 kueyen_n. All rights reserved.
//

import UIKit
import SVProgressHUD

class RegisViewController: UIViewController {

    @IBOutlet weak var usernameBtn: UITextField!
    @IBOutlet weak var passwordBtn: UITextField!
    @IBOutlet weak var emailBtn: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signupBtn(_ sender: Any) {
        if usernameBtn.text == "" {
            SVProgressHUD.showError(withStatus: "อย่าเนียนไม่ใส่Username")
        } else if passwordBtn.text == "" {
            SVProgressHUD.showError(withStatus: "อย่าเนียนไม่ใส่Password")
        } else if emailBtn.text == "" {
            SVProgressHUD.showError(withStatus: "อย่าเนียนไม่ใส่Email")
        } else {
            performSegue(withIdentifier: "login", sender: self)
            SVProgressHUD.showSuccess(withStatus: "สมัครสำเร็จ")
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
