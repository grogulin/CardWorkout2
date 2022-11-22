//
//  CardSelectionVC.swift
//  CardWorkout
//
//  Created by Ярослав Грогуль on 22.11.2022.
//

import UIKit

let systemGreen = CGColor(
    red: 98/255,
    green: 199/255,
    blue: 98/255,
    alpha: 1)

let systemRed = CGColor(
    red: 235/255,
    green: 78/255,
    blue: 61/255,
    alpha: 1)


class CardSelectionVC: UIViewController {
    @IBOutlet var cardImageView: UIImageView!
    @IBOutlet var buttons: [UIButton]!
    
    @IBOutlet var uniButton: UIButton!
    
    var cards: [UIImage] = Card.allValues
    
    var timer: Timer?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        startTimer()
        
//        uniButton.titleLabel?.font = UIFont(name: "System Regular", size: 19)
        uniButton.setTitle("Start", for: .normal)
        uniButton.layer.backgroundColor = systemGreen
        
        //UIColor.systemGreen.cgColor
        uniButton.layer.cornerRadius = 10
        
        
        for button in buttons {
            button.layer.cornerRadius = 10
        }
        

        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer!.invalidate()
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.02, target: self, selector: #selector(showRandomImage), userInfo: nil, repeats: true)
    }
    
    @objc func showRandomImage() {
        cardImageView.image = cards.randomElement() ?? UIImage(named: "AS")
    }
    
    
    
//    @IBAction func stopButtonTapped(_ sender: UIButton) {
//        timer!.invalidate()
//
//    }
    
    @IBAction func restartButtonTapped(_ sender: UIButton) {
        timer!.invalidate()
        startTimer()
        
    }
    
    @IBAction func uniButtonTapped(_ sender: UIButton) {
        if (uniButton.currentTitle == "Start") {
            uniButton.setTitle("Stop", for: .normal)
            uniButton.layer.backgroundColor = systemRed
            startTimer()
        } else {
            uniButton.setTitle("Start", for: .normal)
            uniButton.layer.backgroundColor = systemGreen
            timer!.invalidate()
        }
    }
    

}
