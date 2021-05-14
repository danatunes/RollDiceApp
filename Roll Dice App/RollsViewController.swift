//
//  RollsViewController.swift
//  Roll Dice App
//
//  Created by Магжан Бекетов on 15.04.2021.
//

import UIKit

protocol RollsViewControllerProtocol : NSObjectProtocol{
    func sendBack(tupple : (first : Int , second : Int))
}

class RollsViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    public var rolls : [(first : Int , second : Int)] = [(Int , Int)]()

    public weak var delegate : RollsViewControllerProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(RollTableViewCell.nib, forCellReuseIdentifier: RollTableViewCell.identifier)
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
    
        self.dismiss(animated: true, completion: nil)
    }

}

extension RollsViewController : UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        let roll = rolls[indexPath.row]
        delegate?.sendBack(tupple: roll)
        dismiss(animated: true, completion: nil)
    }
    
}

extension RollsViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rolls.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: RollTableViewCell.identifier, for: indexPath) as! RollTableViewCell
        cell.roll = rolls[indexPath.row]
        return cell
    }
    
    
}
