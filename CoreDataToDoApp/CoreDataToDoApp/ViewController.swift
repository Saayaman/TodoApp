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
    let appDelegate = (UIApplication.shared.delegate as! AppDelegate)
    var context:NSManagedObjectContext!
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        context = appDelegate.persistentContainer.viewContext
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Todo")
        do {
            todos = try context.fetch(fetchRequest as! NSFetchRequest<NSFetchRequestResult>) as! [Todo]
        }
        catch {
            print("Fetching Failed")
        }
        
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func deleteBtn(_ sender: UIBarButtonItem) {
        
        
        
    }
    
    @IBAction func addBtn(_ sender: UIBarButtonItem) {
        
    }
}


extension ViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell") as! TableViewCell
        
        
        if todos.count != 0 {
            let todo = todos[indexPath.row]
            if let task = todo.task{
                cell.nameLabel.text = task
            }
        }
        
        return cell
        
    }
    
    
}

extension ViewController: UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete{
            
            if todos.count != 0 {

            let todo = todos[indexPath.row]
            context.delete(todo)
            appDelegate.saveContext()
                
            }
        }
    }
}

