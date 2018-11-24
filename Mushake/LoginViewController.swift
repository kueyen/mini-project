//
//  LoginViewController.swift
//  Mushake
//
//  Created by pzpopori's mac air on 14/11/2561 BE.
//  Copyright © 2561 kueyen_n. All rights reserved.
//

import UIKit
import SVProgressHUD




class LoginViewController: UIViewController {

    @IBOutlet weak var userBtn: UITextField!
    @IBOutlet weak var passwordBtn: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
    }
    
    @IBAction func loginBtn(_ sender: Any) {
        if userBtn.text == "" {
            SVProgressHUD.showError(withStatus: "อย่าเนียนไม่ใส่Username")

        }else if passwordBtn.text == "" {
            
            SVProgressHUD.showError(withStatus: "อย่าเนียนไม่ใส่Password")
            
        }else {
            performSegue(withIdentifier: "home", sender: self)
            SVProgressHUD.showSuccess(withStatus: "ยินดีต้อนรับสู่MUSHAKE")
        }
        
        
    }
    
    @IBAction func passwordBtn(_ sender: Any) {
        
        
        
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
