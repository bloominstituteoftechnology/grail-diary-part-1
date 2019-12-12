//
//  POIsTableViewController.swift
//  GrailDiary
//
//  Created by Kenny on 12/7/19.
//  Copyright © 2019 Hazy Studios. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var poiModels: [POI]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        setupView()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPOIModalSegue" {
            guard let destination = segue.destination as? AddPOIViewController else {return}
            destination.delegate = self
        } else if segue.identifier == "ShowPOIDetailSegue" {
            guard let destination = segue.destination as? POIDetailViewController else {return}
            guard let selectedCell = tableView.indexPathForSelectedRow?.row else {return}
            destination.poi = self.poiModels?[selectedCell]
        }
    }

}

extension POIsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return poiModels?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as? POITableViewCell {
            cell.selectionStyle = .none
            
            guard let thisPoi = self.poiModels?[indexPath.row] else {return cell}
            cell.poi = thisPoi
            return cell
        }
        return UITableViewCell()
    }
    
    //MARK: Helper Methods
    func populateTableView() {
        self.poiModels = [POI(location: "Eggciting Mystery!", country: "Russia", clues: ["The original one of me was made for a Third man named Alexander", "Some would say I'm FABulous", "I'm EGGcited that you'll figure out where I'm on display! (If anyone even knows where I am, teehee)"])]
        tableView.reloadData()
    }
    
    func setupView() {
        self.tableView?.separatorColor = .clear
        populateTableView()
    }
}

extension POIsTableViewController: AddPOIDelegate {
    func poiWasAdded(_ poi: POI) {
        poiModels?.append(poi)
        self.dismiss(animated: true, completion: nil)
        tableView.reloadData()
    }
}

//allow user to delete cells not working
extension POIsTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCell.EditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {        
        if (editingStyle == .delete) {
            self.poiModels?.remove(at: indexPath.row)
            tableView.deleteRows(at: [(indexPath as IndexPath)], with: .fade) //fade animation when deleting row
            tableView.reloadData()
        }
        
    }
}
