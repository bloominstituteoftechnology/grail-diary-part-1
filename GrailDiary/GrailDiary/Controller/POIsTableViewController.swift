//
//  POIsTableViewController.swift
//  GrailDiary
//
//  Created by Kenny on 12/7/19.
//  Copyright © 2019 Hazy Studios. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    
    var poiModels: [POI]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        self.poiModels = [POI(location: "test", country: "test", clues: [])]
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPOIModalSegue" {
            guard let destination = segue.destination as? AddPOIViewController else {return}
            destination.delegate = self
        }
    }

}

extension POIsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return poiModels?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as? POITableViewCell {
            print("custom cell")
            guard let thisPoi = self.poiModels?[indexPath.row] else {return cell}
            cell.configureCell(poi: thisPoi)
            return cell
        }
        return UITableViewCell()
    }
}

extension POIsTableViewController: AddPOIDelegate {
    func poiWasAdded(_ poi: POI) {
        poiModels?.append(poi)
        self.dismiss(animated: true, completion: nil)
        tableView.reloadData()
    }
}
