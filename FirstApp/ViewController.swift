//
//  ViewController.swift
//  FirstApp
//
//  Created by 张环宇 on 2022/8/18.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func showAlert() {
        let alert = UIAlertController(
            title: "你好！",
            message: "这是我的第一个App",
            preferredStyle: .alert)
        
        let action = UIAlertAction(
            title: "这可太棒了！",
            style: .default,
            handler: nil
        )
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
            


}

