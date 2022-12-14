//
//  ViewController.swift
//  BullsEyeApp
//
//  Created by Gabriel de Castro Chaves on 16/08/22.
//

import UIKit

final class MainViewController: UIViewController {
    
    //MARK: - Vars
    private var targetValue = 0
    private var currentValue: Int = 0
    private var score = 0
    private var points = 0
    private var difference = 0
    private var round = 0
    
    
    //MARK: - IBOutlets
    @IBOutlet weak private var slider: UISlider!
    @IBOutlet weak private var scoreLabel: UILabel!
    @IBOutlet weak private var roundLabel: UILabel!
    @IBOutlet weak var targetLabel: UILabel!
    
    //MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSliderImages()
        startNewGame()
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
        score = 0
        points = 0
        round = 0
        startNewGame()
        setupLabels()
        
        let transition = CATransition()
          transition.type = CATransitionType.fade
          transition.duration = 1
          transition.timingFunction = CAMediaTimingFunction(
            name: CAMediaTimingFunctionName.easeOut)
          view.layer.add(transition, forKey: nil)
    }
    
    //MARK: - Funcs
    
    private func setupSliderImages() {
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")!
        slider.setThumbImage(thumbImageNormal, for: .normal)
        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")!
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        let trackLeftImage = UIImage(named: "SliderTrackLeft")!
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        let trackRightImage = UIImage(named: "SliderTrackRight")!
        let trackRightResizable = trackRightImage.resizableImage(
            withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
    }
    
    private func startNewGame() {
        targetValue = Int.random(in: 1...100)
        round += 1
        setupLabels()
 
    }
    
    private func setupLabels() {
        scoreLabel.text = String(score)
        targetLabel.text = "Coloque o alvo o mais pr??ximo que consegue de:  \(targetValue)"
        roundLabel.text = String(round)
    }
    
    private func differenceBetweenSliderAndTarget() {
        let sliderInt = lroundf(self.slider.value)
        difference  = abs(targetValue - sliderInt)
    }
    
    private func calculatePlayerScore() {
        if difference == 0 {
            points = 200 - difference
            score += points
        }
        else {
            points = 100 - difference
            score += points
        }
    }
    
    private func showAlert() {
        let alert = UIAlertController(
            title: scoreTitle(difference),
            message: "O valor que voc?? acertou ??: \(currentValue)" +
            "\n Faltou: \(difference) para ser perfeito" +
            "\n Sua pontua????o ??: \(points)",
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
        if difference == 0 {
            return "Perfeito! Voc?? ganhou 100 pontos de b??nus"
        }
        else if difference <= 5 {
            return "Quase l??"
        }
        else if difference > 5 {
            return "N??o foi dessa vez"
        }
        return String()
    }

}
