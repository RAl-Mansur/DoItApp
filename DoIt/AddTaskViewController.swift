//
//  AddTaskViewController.swift
//  DoIt
//
//  Created by Ridwan Al-Mansur on 24/08/2016.
//  Copyright © 2016 Ridwan Al-Mansur. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController {

    @IBOutlet weak var importantSwitch: UISwitch!
    @IBOutlet weak var taskName: UITextField!
    
    var previousVC = TasksViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func addTask(_ sender: AnyObject) {
        // Create a task from outlet information
        let task = Task()
        task.taskName = taskName.text!
        task.important = importantSwitch.isOn
        
        // Add new task to array in previous ViewController
        previousVC.tasks.append(task)
        previousVC.tableView.reloadData()
        
        navigationController!.popViewController(animated: true)
    }
}
