//
//  POIsTableViewController.swift
//  Grail Diary
//
//  Created by John Holowesko on 11/17/19.
//  Copyright © 2019 John Holowesko. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {

    var pois: [POI] = [POI(location: "Nassau", country: "Bahamas", clues: ["Here's clue 1", "Here's Clue 2", "Lastly, here's clue 3"])]
    
    // MARK: - IBOutlets
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPOIModalSegue" {
            if let addPOIVC = segue.destination as? AddPOIViewController {
                addPOIVC.delegate = self
            }
        } else if segue.identifier == "ShowPOIDetailSegue" {
            if let selectedRow = tableView.indexPathForSelectedRow,
                let showPOIDS = segue.destination as? POIDetailViewController {
                showPOIDS.poi = pois[selectedRow.row]
            }
        }
    }
    
}

extension POIsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pois.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as? POITableViewCell else  { return UITableViewCell() }

        let data = pois[indexPath.row]
        cell.poi = data

        return cell
    }
    
    
}

extension POIsTableViewController: AddPOIDelegate {
    func poiWasAdded(_ poi: POI) {
        pois.append(poi)
        dismiss(animated: true, completion: nil)
        tableView.reloadData()
    }
}
