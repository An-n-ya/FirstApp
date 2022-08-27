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
        // animation
        let transition = CATransition()
        transition.type = CATransitionType.fade
        transition.duration = 1
        transition.timingFunction = CAMediaTimingFunction(
            name: CAMediaTimingFunctionName.easeOut)
        view.layer.add(transition, forKey: nil)
        score = 0
        round = 0
        scoreLabel.text = String(score)
        roundLabel.text = "\(round)"
        reset()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        startNewGame()
        
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")!
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(
            top: 0, left: 14, bottom: 0, right: 14
        )
        
        let trackLeftImage = UIImage(named: "SliderTrackLeft")
        let trackLeftResizable = trackLeftImage?.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        let trackRightImage = UIImage(named: "SliderTrackRight")
        let trackRightResizable = trackRightImage?.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
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
        let message = "你的分数为：\(points)"
        
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

