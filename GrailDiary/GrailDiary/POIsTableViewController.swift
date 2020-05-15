//
//  POIsTableViewController.swift
//  GrailDiary
//
//  Created by Craig Swanson on 9/19/19.
//  Copyright © 2019 Craig Swanson. All rights reserved.
//

import UIKit


class POIsTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var pois: [POI] = []
    
    var persistentStoreURL: URL! {
        if let documentURL = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true) {
            let persistentStoreURL = documentURL.appendingPathComponent("grailPOIList.plist")
            return persistentStoreURL
        }
        return nil
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let data = try? Data(contentsOf: persistentStoreURL),
            let savedPOIs = try? PropertyListDecoder().decode([POI].self, from: data) {
            pois = savedPOIs
        }
    }
    
    func save() {
        if let data = try? PropertyListEncoder().encode(pois) {
            try? data.write(to: persistentStoreURL)
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPOIModalSegue" {
            guard let addPOIVC = segue.destination as? AddPOIViewController
                else { fatalError() }
            addPOIVC.delegate = self
        } else if segue.identifier == "ShowPOIDetailSegue" {
            if let indexPath = tableView.indexPathForSelectedRow,
                let poiDetailVC = segue.destination as? POIDetailViewController {
                poiDetailVC.poi = pois[indexPath.row]
            }
        }
    }

}

// MARK: Table View Data Source
extension POIsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        pois.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "POITableViewCell", for: indexPath) as?
            POITableViewCell else { return UITableViewCell() }
        
        let poi = pois[indexPath.row]
        cell.poi = poi
        
        return cell
    }

}

// MARK: Table View Delegate (Swipe to delete)
extension POIsTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        pois.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
        
        save()
        
    }
        
}

// MARK: Add POI Delegate
// this is the intern; the add poi VC is the boss
extension POIsTableViewController: AddPOIDelegate {
    func poiWasAdded(_ poi: POI) {
        pois.append(poi)
        tableView.reloadData()
        dismiss(animated: true, completion: nil)
        
        save()
        
    }
}

