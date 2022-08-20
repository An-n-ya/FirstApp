//
//  ViewController.swift
//  FirstApp
//
//  Created by 张环宇 on 2022/8/18.
//

import UIKit

class ViewController: UIViewController {
    var currentValue: Int = 1
    var targetValue: Int = 0
    var round: Int = 0
    var score: Int = 0
    @IBOutlet var roundLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var slider: UISlider!
    @IBOutlet var target: UILabel!
    
    func updateScore() {
        score += 100 - abs(currentValue - targetValue)
        round += 1
        scoreLabel.text = String(score)
        roundLabel.text = "\(round)"
    }
    
    func reset() {
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        target.text = String(targetValue) // 或者是"\(targetValue)"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
        reset()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func showAlert() {
        let message = "现在滑动块的值是：\(currentValue)" + "\n目标值为：\(targetValue)"
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
        
        updateScore()
        reset()
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
    }


}

