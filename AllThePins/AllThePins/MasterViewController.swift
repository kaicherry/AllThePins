//
//  MasterViewController.swift
//  AllThePins
//
//  Created by Kai Cherry on 3/19/19.
//  Copyright © 2019 RnSKSoft. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    var objects = [VPinTable]()
    var userSet = [VPinTable]()
    var currentFiltered = [VPinTable]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationItem.leftBarButtonItem = editButtonItem

        if let split = splitViewController {
            let controllers = split.viewControllers
            detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let jsonData = try! Data(contentsOf: URL(fileReferenceLiteralResourceName: "woot.json"))
        let decoder = JSONDecoder()
        objects = try! decoder.decode([VPinTable].self, from: jsonData)
        tableView.reloadData()
        currentFiltered.removeAll()
        for vpin in objects{
        
//            let theYear = Int(vpin.ipdbInfo.year ?? "") ?? 0
//            if theYear > 1989 && theYear < 2000 {
            if let _ = UIImage(named: "\(vpin.tableName).png"), vpin.tableName != ""  {
                currentFiltered.append(vpin)
            }
        }
        
        objects.removeAll()
        objects = currentFiltered
        tableView.reloadData()
        
            
            
    }

    @objc
    func insertNewObject(_ sender: Any) {
        objects.insert(VPinTable(), at: 0)
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let object = objects[indexPath.row]
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem = object
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.navigationItem.title = currentFiltered.count > 0 ?  "Visual Pinball Tables – \(objects.count)*" : "Visual Pinball Tables – \(objects.count)"
        return objects.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let object = objects[indexPath.row]
        cell.textLabel!.text = object.tableName
        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            objects.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }


}

