//
//  CardSelectionVC.swift
//  CardWorkout
//
//  Created by Ярослав Грогуль on 22.11.2022.
//

import UIKit

class CardSelectionVC: UIViewController {
    @IBOutlet var cardImageView: UIImageView!
    @IBOutlet var buttons: [UIButton]!
    
    @IBOutlet var uniButton: UIButton!
    
    var cards: [UIImage] = Card.allValues
    
    var timer: Timer?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startTimer()
        
        uniButton.setTitle("Start", for: .normal)
        uniButton.layer.backgroundColor = CGColor.init(red: 0, green: 1, blue: 0, alpha: 1)
        
        
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
    
    
    
    @IBAction func stopButtonTapped(_ sender: UIButton) {
        timer!.invalidate()
        
    }
    
    @IBAction func restartButtonTapped(_ sender: UIButton) {
        timer!.invalidate()
        startTimer()
        
    }
    
    @IBAction func uniButtonTapped(_ sender: UIButton) {
        if (uniButton.currentTitle == "Start") {
            uniButton.setTitle("Stop", for: .normal)
            uniButton.layer.backgroundColor = CGColor.init(red: 1, green: 0, blue: 0, alpha: 1)
        } else {
            uniButton.setTitle("Start", for: .normal)
            uniButton.layer.backgroundColor = CGColor.init(red: 0, green: 1, blue: 0, alpha: 1)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
