//
//  TableViewController.swift
//  CoreDataPhoto
//
//  Created by Gabriel Martinez on 2018-02-11.
//  Copyright © 2018 Gabriel Martinez. All rights reserved.
//

import UIKit
import CoreData

class TableViewController: UITableViewController, NSFetchedResultsControllerDelegate {
    
    
    var frc : NSFetchedResultsController = NSFetchedResultsController<NSFetchRequestResult>()
    
    var pc = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    func fetchRequest() -> NSFetchRequest<NSFetchRequestResult> {
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Entity")
        let sorter = NSSortDescriptor(key:  "titletext", ascending: true)
        fetchRequest.sortDescriptors = [sorter]
        
        return fetchRequest
        
    }
    
    func getFRC() -> NSFetchedResultsController<NSFetchRequestResult>{
        
        frc = NSFetchedResultsController(fetchRequest: fetchRequest(), managedObjectContext: pc, sectionNameKeyPath: nil, cacheName: nil)
        return frc
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        frc = getFRC()
        frc.delegate = self
        do {
            try frc.performFetch()
        }catch{
            print(error)
            return
        }
        self.tableView.reloadData()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let numberOfRows = frc.sections?[section].numberOfObjects
        return numberOfRows!
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell

        // Configure the cell...
        let item = frc.object(at: indexPath) as! Entity
        cell.cellTitle.text = item.titletext
        cell.cellDescription.text = item.descriptiontext
        
        cell.cellImage.image = UIImage(data: (item.image)! as Data)
        
        
        return cell
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.reloadData()
    }

   

}
