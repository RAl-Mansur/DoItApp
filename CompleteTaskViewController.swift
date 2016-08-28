//
//  CompleteTaskViewController.swift
//  DoIt
//
//  Created by Ridwan Al-Mansur on 27/08/2016.
//  Copyright © 2016 Ridwan Al-Mansur. All rights reserved.
//

import UIKit

class CompleteTaskViewController: UIViewController {

    var task: Task? = nil
    @IBOutlet weak var taskLbl: UILabel!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if task!.important {
            taskLbl.text = "❗\(task!.name!)"
        } else {
            taskLbl.text =  task!.name
        }

        
    }

    @IBAction func completeBtn(_ sender: AnyObject) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        context.delete(task!)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController!.popViewController(animated: true)
    }
}
