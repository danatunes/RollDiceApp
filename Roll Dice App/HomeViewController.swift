//
//  ViewController.swift
//  Roll Dice App
//
//  Created by Магжан Бекетов on 15.04.2021.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet private weak var firstImageView: UIImageView!
    @IBOutlet private weak var secondImageView: UIImageView!
    @IBOutlet private weak var rollButton: UIButton!
    
    private var rolls : [(first : Int , second : Int)] = [(Int , Int)]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rollButton.layer.cornerRadius = 4
        rollButton.layer.masksToBounds = true
    }
    
    @IBAction func openRollsPressed(_ sender: UIButton) {
        let storyboard  = UIStoryboard(name: "Main", bundle: Bundle.main)
        if let vc = storyboard.instantiateViewController(withIdentifier: "RollsViewController") as? RollsViewController{
            vc.modalPresentationStyle = .fullScreen
            vc.rolls = rolls
            vc.delegate = self

            present(vc, animated: true, completion: nil)
        }
        
    }
    
    @IBAction private func rollButtonPressed(_ sender: UIButton) {
        changeDice()
    }
    
    private func changeDice(){
        let randomNumber1 = Int(arc4random() % 6)
        let randomNumber2 = Int(arc4random() % 6)
        
        rolls.append((first: randomNumber1 , second: randomNumber2))
        
        firstImageView.image = UIImage(named: "dice\(randomNumber1)")
        secondImageView.image = UIImage(named: "dice\(randomNumber2)")
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        changeDice()
    }
}

extension HomeViewController : RollsViewControllerProtocol{
    func sendBack(tupple: (first: Int, second: Int)) {
        self.firstImageView.image = UIImage(named: "dice\(tupple.first)")
        self.secondImageView.image = UIImage(named: "dice\(tupple.second)")
    }
}
