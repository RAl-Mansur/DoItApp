//
//  CompleteTaskViewController.swift
//  DoIt
//
//  Created by Ridwan Al-Mansur on 27/08/2016.
//  Copyright © 2016 Ridwan Al-Mansur. All rights reserved.
//

import UIKit

class CompleteTaskViewController: UIViewController {

    var task = Task()
    @IBOutlet weak var taskLbl: UILabel!
    var previousVC = TasksViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if task.important {
            taskLbl.text = "❗\(task.taskName)"
        } else {
            taskLbl.text =  task.taskName
        }

        
    }

    @IBAction func completeBtn(_ sender: AnyObject) {
        
        previousVC.tasks.remove(at: previousVC.selectedIndex)
        previousVC.tableView.reloadData()
        navigationController?.popViewController(animated: true)
    }
}
