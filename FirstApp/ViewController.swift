//
//  ViewController.swift
//  FirstApp
//
//  Created by 张环宇 on 2022/8/18.
//

import UIKit

class ViewController: UIViewController {
    var currentValue: Int = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func showAlert() {
        let message = "现在滑动块的值是：\(currentValue)"
        let alert = UIAlertController(
            title: "你好！",
            message: message,
            preferredStyle: .alert)
        
        let action = UIAlertAction(
            title: "这可太棒了！",
            style: .default,
            handler: nil
        )
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
    }


}

