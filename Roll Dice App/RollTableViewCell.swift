//
//  RollTableViewCell.swift
//  Roll Dice App
//
//  Created by Магжан Бекетов on 15.04.2021.
//

import UIKit



class RollTableViewCell: UITableViewCell {

    public static let identifier = String(describing: RollTableViewCell.self)
    public static let nib = UINib(nibName: identifier, bundle: nil)

    
    @IBOutlet private weak var firstLabel: UILabel!
    @IBOutlet private weak var secondLabel: UILabel!
    
    public var roll : (first : Int , second : Int)? {
        didSet{
            if let roll = roll{
                firstLabel.text = "first : \(roll.first + 1)"
                secondLabel.text = "second : \(roll.second + 1)"
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

}
