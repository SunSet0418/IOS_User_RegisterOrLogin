//
//  ViewController.swift
//  IOS_Login_Example
//
//  Created by SungWoon Cho on 2018. 3. 11..
//  Copyright © 2018년 SunSet. All rights reserved.
//

import UIKit
import Alamofire
import Toaster

class LoginView: UIViewController {

    @IBOutlet weak var IDText: UITextField!
    @IBOutlet weak var PWText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func LoginBtn(_ sender: Any) {
        let URL = "http://192.168.219.100:3000/login"
        
        let Params = [
            "id" : IDText.text!,
            "password" : PWText.text!
        ]
    
        Alamofire.request(URL, method: .post, parameters: Params).responseJSON{
            response in
            let ResData = response.result.value as! NSDictionary
            if ResData["success"] as! Bool == true {
                self.performSegue(withIdentifier: "ToMain", sender: nil)
                Toast(text:"로그인 성공", delay:Delay.short).show()
            }
            else{
                Toast(text:"로그인 실패",delay:Delay.short).show()
            }
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

