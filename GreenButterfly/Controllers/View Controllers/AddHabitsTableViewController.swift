//
//  AddHabitsTableViewController.swift
//  GreenButterfly
//
//  Created by Jordan Furr on 5/9/20.
//  Copyright © 2020 Jordan Furr. All rights reserved.
//

import UIKit
import CoreData

class AddHabitsTableViewController: UITableViewController {
    
    var habits: [Habit] = []
    
    override func viewWillAppear(_ animated: Bool) {
         habits = HabitController.shared.habits.filter({$0.enabled == false})
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.allowsMultipleSelection = true
        habits = HabitController.shared.habits.filter({$0.enabled == false})
    }
    //MARK: - IB Actions
    @IBAction func doneTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return habits.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newHabitCell", for: indexPath)
        let habit = habits[indexPath.row]
        cell.textLabel?.text = habit.title
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 48.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = .checkmark
        let habit = habits[indexPath.row]
        HabitController.shared.enableToggle(habit: habit)
        print("\(habit.title) \(habit.enabled)")
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = .none
        let habit = habits[indexPath.row]
        HabitController.shared.enableToggle(habit: habit)
        print("\(habit.title) \(habit.enabled)")
    }
    
}
