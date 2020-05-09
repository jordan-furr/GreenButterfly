//
//  HabitTableViewCell.swift
//  GreenButterfly
//
//  Created by Jordan Furr on 5/9/20.
//  Copyright © 2020 Jordan Furr. All rights reserved.
//

import UIKit

protocol HabitTableViewCellDelegate: class {
    func tappedButton(for cell: HabitTableViewCell)
}

class HabitTableViewCell: UITableViewCell {
    
    var habit: Habit?
    weak var delegate: HabitTableViewCellDelegate?
    
    //MARK: - IB Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var counterLabel: UILabel!
    
    //MARK: - IB Actions
    @IBAction func plusButtonTapped(_ sender: Any) {
        delegate?.tappedButton(for: self)
    }
    
    //MARK: - Helper Funcs
    func setHabit(habit: Habit){
        self.habit = habit
        updateUI()
    }
    
    @objc func updateUI(){
        guard let habit = habit else {return}
        titleLabel.text = habit.title
        counterLabel.text = "\(habit.counter)"
    }
}
