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
    
    
    var people:[Person] = []
    
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Person")
        do {
            people = try context.fetch(fetchRequest as! NSFetchRequest<NSFetchRequestResult>) as! [Person]
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
        
        
        if people.count != 0 {
            let person = people[indexPath.row]
            if let name = person.name{
                cell.nameLabel.text = name
            }
        }
        
        return cell
        
    }
    
    
}

extension ViewController: UITableViewDataSource{
    
}

