//
//  ViewController.swift
//  BullsEyeApp
//
//  Created by Gabriel de Castro Chaves on 16/08/22.
//

import UIKit

final class ViewController: UIViewController {
    
    
    //MARK: - Vars
    private var targetValue = 0
    private var currentValue: Int = 0
    private var score = 0
    private var points = 0
    private var difference = 0
    private var round = 0
    
    
    //MARK: - IBOutlets
    @IBOutlet weak private var targetLabel: UILabel!
    @IBOutlet weak private var slider: UISlider!
    @IBOutlet weak private var scoreLabel: UILabel!
    @IBOutlet weak private var roundLabel: UILabel!
    
    //MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNewRound()
        setupLabels()
    }
    
    //MARK: - IBActions
    @IBAction func hitMeButton(_ sender: UIButton) {
        currentValue = lroundf(slider.value)
        differenceBetweenSliderAndTarget()
        calculatePlayerScore()
        showAlert()
    }
    
    @IBAction func startsOverButton(_ sender: UIButton) {
        targetValue = 0
        currentValue = 0
        score = 0
        points = 0
        difference = 0
        round = 0
    }
    
    //MARK: - Funcs
    
    
    private func setupNewRound() {
        targetValue = Int.random(in: 0...100)
        round += 1
        setupLabels()
    }
    
    private func setupLabels() {
        scoreLabel.text = String(score)
        targetLabel.text = String(targetValue)
        roundLabel.text = String(round)
    }
    
    private func differenceBetweenSliderAndTarget() {
        let sliderInt = lroundf(self.slider.value)
        difference  = abs(targetValue - sliderInt)
    }
    
    private func calculatePlayerScore() {
        points = 100 - difference
        score += points
    }
    
    
    private func showAlert() {
        let alert = UIAlertController(
            title: scoreTitle(difference),
            message:
                "The value of the slider is: \(currentValue)" +
            "\nThe target value is: \(targetValue)" +
            "\n The difference is: \(difference)" +
            "\n Your current score is: \(score)" +
            "\n You scored: \(points)",
            preferredStyle: .alert)
        
        let action = UIAlertAction(
            title: "Cool",
            style: .default,
            handler: { newRound in
                self.setupNewRound()
            })
        
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    private func scoreTitle(_ difference: Int) -> String {
        if difference <= 1 {
            return "Perfeito!"
        }
        else if difference < 5 {
            return "Quase lá"
        }
        else if difference < 10 {
            return "Não foi dessa vez"
        }
        return String()
    }
    
    
}
