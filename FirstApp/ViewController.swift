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
    
    func updateScore(points: Int) {
        score += points
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
    
    @IBAction func startNewGame() {
        score = 0
        round = 0
        scoreLabel.text = String(score)
        roundLabel.text = "\(round)"
        reset()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        startNewGame()
    }
    
    @IBAction func showAlert() {
        
        let title: String
        let difference = abs(currentValue - targetValue)
        var points = 100 - difference
        if difference == 0 {
            title = "完美！"
            points += 100
        } else if difference < 5 {
            title = "就差一点点"
            if difference == 1 {
                points += 50
            }
        } else if difference < 10 {
            title = "不错"
        } else {
            title = "差太远了！"
        }
        let message = "你的分数为：\(100 - difference)"
        
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        
        let action = UIAlertAction(
            title: "好",
            style: .default,
            handler: { _ in
                self.updateScore(points: points)
                self.reset()
            }
        )
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
//        updateScore(points: points)
//        reset()
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
    }
}

