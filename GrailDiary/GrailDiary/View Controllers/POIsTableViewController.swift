//
//  POIsTableViewController.swift
//  GrailDiary
//
//  Created by dc on 2/18/20.
//  Copyright © 2020 Diego Covarrubias. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController, UITableViewDelegate {
    
    var pois: [POI] = []
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }
        
        if identifier == "AddPOIModalSegue",
                let apvc = segue.destination as? AddPOIViewController {
            apvc.delegate = self
        }
    }
}

extension POIsTableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pois.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath)
        
        if let poiCell = cell as? POITableViewCell {
            poiCell.poi = pois[indexPath.row]
        }
        
        return cell
    }
}

extension POIsTableViewController: AddPOIDelegate {
    
    func poiWasAdded(_ poi: POI) {
        pois.append(poi)
        dismiss(animated: true)
        tableView.reloadData()
    }
}
