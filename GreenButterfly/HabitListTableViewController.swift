//
//  HabitListTableViewController.swift
//  GreenButterfly
//
//  Created by Jordan Furr on 5/8/20.
//  Copyright © 2020 Jordan Furr. All rights reserved.
//

import UIKit
import CoreData

class HabitListTableViewController: UITableViewController {
    
    var habits: [Habit] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        habits = HabitController.shared.habits.filter({$0.enabled == true})
        tableView.allowsSelection = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        habits = HabitController.shared.habits.filter({$0.enabled == true})
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return habits.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "habitCell", for: indexPath)
        let habit = habits[indexPath.row]
        cell.textLabel?.text = habit.title
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let habit = habits[indexPath.row]
            habits.remove(at: indexPath.row)
            HabitController.shared.enableToggle(habit: habit)
            tableView.deleteRows(at: [indexPath], with: .left)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailView"{
            if let destinationVC = segue.destination as? DetailViewController {
                if let index = tableView.indexPathForSelectedRow{
                    let habit = HabitController.shared.habits[index.row]
                    destinationVC.habit = habit
                }
            }
        }
    }
}
