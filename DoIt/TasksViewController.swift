//
//  TasksViewController.swift
//  DoIt
//
//  Created by Ridwan Al-Mansur on 24/08/2016.
//  Copyright © 2016 Ridwan Al-Mansur. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {


    @IBOutlet weak var tableView: UITableView!
    
    
    var tasks: [Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tasks = makeTasks()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        
        
        if task.important {
            cell.textLabel?.text = "❗\(task.taskName)"
        } else {
            cell.textLabel?.text = task.taskName
        }
        
        return cell
    }

    
    func makeTasks() -> [Task] {
        let task1 = Task()
        task1.taskName = "Make bed"
        task1.important = false
        
        let task2 = Task()
        task2.taskName = "Buy cheese"
        task2.important = true
        
        let task3 = Task()
        task3.taskName = "Mow the lawn"
        task3.important = false
        
        
        return [task1, task2, task3]
        
    }
    
    @IBAction func addTask(_ sender: AnyObject) {
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC = segue.destination as! AddTaskViewController
        nextVC.previousVC = self
    }


}
