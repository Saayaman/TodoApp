//
//  ViewController.swift
//  CoreDataToDoApp
//
//  Created by ayako_sayama on 2017-07-28.
//  Copyright © 2017 ayako_sayama. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    
    var todos:[Todo] = []
    
    @IBOutlet weak var deleteBtn: UIBarButtonItem!
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Todo")
        do {
            todos = try context.fetch(fetchRequest as! NSFetchRequest<NSFetchRequestResult>) as! [Todo]
            refreshTableView()
        }
        catch {
            print("Fetching Failed")
        }
    }
    
    func refreshTableView(){
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func deleteBtn(_ sender: UIBarButtonItem) {
        
        
        
    }
    
    @IBAction func addBtn(_ sender: UIBarButtonItem) {
        
        let alert = UIAlertController(title: "AlertController Tutorial",
                                      message: "Submit something",
                                      preferredStyle: .alert)
        
        // Submit button
        let submitAction = UIAlertAction(title: "Add", style: .default, handler: { (action) -> Void in
            // Get 1st TextField's text
            let textField = alert.textFields![0]
            
            let todo = Todo(context: self.context)
            todo.task = textField.text
            self.todos.append(todo)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            self.refreshTableView()
        })
        
        // Cancel button
        let cancel = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        
        // Add 1 textField and customize it
        alert.addTextField { (textField: UITextField) in
            textField.keyboardAppearance = .dark
            textField.keyboardType = .default
            textField.autocorrectionType = .default
            textField.placeholder = "Type something here"
            textField.clearButtonMode = .whileEditing
        }
        
        // Add action buttons and present the Alert
        alert.addAction(submitAction)
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
        
    }
  }


extension ViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete{
            
                let todo = todos[indexPath.row]
                context.delete(todo)
                todos.remove(at: indexPath.row)
                (UIApplication.shared.delegate as! AppDelegate).saveContext()
        }
        
        refreshTableView()
    }

    
}

extension ViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        let todo = todos[indexPath.row]
        if let task = todo.task{
            cell.textLabel?.text = task
        }
        
        return cell
        
    }

}

