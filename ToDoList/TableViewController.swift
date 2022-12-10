//
//  TableViewController.swift
//  ToDoList
//
//  Created by CHURILOV DMITRIY on 10.12.2022.
//

import UIKit

class TableViewController: UITableViewController {
    var tasks: [String] = []
    
    @IBAction func saveTask(_ sender: Any) {
        let ac = UIAlertController(title: "New task", message: "Please add new task", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Save", style: .default, handler: { action in
            let textField = ac.textFields?.first
            if let task = textField?.text {
                self.tasks.insert(task, at: 0)
            }
        }))
        ac.addAction(UIAlertAction(title: "Cancel", style: .default))
        ac.addTextField()
        present(ac, animated: true)
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = tasks[indexPath.row]
        return cell
    }
    
}
