//
//  TableViewController.swift
//  ToDoList
//
//  Created by CHURILOV DMITRIY on 10.12.2022.
//

import UIKit
import CoreData

class TableViewController: UITableViewController {
    var tasks: [Task] = []
    
    @IBAction func saveTask(_ sender: UIBarButtonItem) {
        let ac = UIAlertController(title: "New task", message: "Please add a new task", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Save", style: .default, handler: { action in
            let textField = ac.textFields?.first
            if let newTaskTitle = textField?.text {
                self.saveTask(withTitle: newTaskTitle)
                self.tableView.reloadData()
            }
        }))
        ac.addAction(UIAlertAction(title: "Cancel", style: .default))
        ac.addTextField()
        present(ac, animated: true)
    }
    
    private func saveTask(withTitle title: String) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        guard let entity = NSEntityDescription.entity(forEntityName: "Task", in: context) else { return }
        
        let taskObject = Task(entity: entity, insertInto: context)
        taskObject.title = title
        
        do {
            try context.save()
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }

    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let task = tasks[indexPath.row]
        cell.textLabel?.text = task.title
        return cell
    }
    
}
