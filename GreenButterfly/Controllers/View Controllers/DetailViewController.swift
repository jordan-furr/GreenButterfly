//
//  DetailViewController.swift
//  GreenButterfly
//
//  Created by Jordan Furr on 5/8/20.
//  Copyright © 2020 Jordan Furr. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var habit: Habit?
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI(){
        guard let habit = habit else {return}
        titleLabel.text = habit.title
    }
}
