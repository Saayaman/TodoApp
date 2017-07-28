//
//  ViewController.swift
//  CoreDataToDoApp
//
//  Created by ayako_sayama on 2017-07-28.
//  Copyright © 2017 ayako_sayama. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
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
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        <#code#>
    }
    
    
}

extension ViewController: UITableViewDataSource{
    
}

