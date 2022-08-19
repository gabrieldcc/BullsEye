//
//  ViewController.swift
//  BullsEyeApp
//
//  Created by Gabriel de Castro Chaves on 16/08/22.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Vars
    var targetValue = 0
    
    //MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
    }
    
    //MARK: - IBOutlets
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    //MARK: - IBActions
    @IBAction func hitMeButton(_ sender: UIButton) {
        showAlert()
        startNewRound()
    }
    
    //MARK: - Funcs
    func startNewRound() {
        targetValue = Int.random(in: 0...100)
        targetLabel.text = "\(targetValue)"
    }
    
    func showAlert() {
        let currentValue = Int(slider.value)
        
        let alert = UIAlertController(
            title: "Hello",
            message: "The value of the slider is: \(currentValue)" +
            "\nThe target value is: \(targetValue)" +
            "\n The difference is: \(differenceBetweenSliderAndTarget(slider: Int(slider.value), target: targetValue))",
            preferredStyle: .alert)
        
        let action = UIAlertAction(
            title: "Cool",
            style: .default,
            handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true)
        
        print("o retorno do slider vs target é ")
    }
    
    
    func differenceBetweenSliderAndTarget(slider: Int, target: Int) -> Int {
        var difference = slider - target
        if  difference < 0 {
           difference = difference * -1
        }
        return difference
    }
    
}
