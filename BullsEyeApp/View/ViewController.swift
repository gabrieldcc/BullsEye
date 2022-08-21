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
        startNewGame()
        setupLabels()
        let thumbImageNormal = UIImage(systemName: "target")!
        thumbImageNormal.withTintColor(.red)
        slider.setThumbImage(thumbImageNormal, for: .normal)
    }
    
    //MARK: - IBActions
    @IBAction func hitMeButton(_ sender: UIButton) {
        currentValue = lroundf(slider.value)
        differenceBetweenSliderAndTarget()
        calculatePlayerScore()
        showAlert()
    }

    @IBAction func startsOverButton(_ sender: UIButton) {
        score = 0
        points = 0
        startNewGame()
        setupLabels()
        
    }

    //MARK: - Funcs

    private func startNewGame() {
        targetValue = Int.random(in: 1...100)
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
            message: "O valor que você acertou é: \(currentValue)" +
            "\n Faltou: \(difference) para ser perfeito" +
            "\n Sua pontuação é: \(points)",
            preferredStyle: .alert)
        
        let action = UIAlertAction(
            title: "Ok",
            style: .default,
            handler: { _ in
                self.startNewGame()
            })
        
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    private func scoreTitle(_ difference: Int) -> String {
        if difference <= 1 {
            return "Perfeito!"
        }
        else if difference <= 5 {
            return "Quase lá"
        }
        else if difference > 5 {
            return "Não foi dessa vez"
        }
        return String()
    }

}
