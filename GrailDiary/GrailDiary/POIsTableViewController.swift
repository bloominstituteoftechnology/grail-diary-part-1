//
//  ViewController.swift
//  GrailDiary
//
//  Created by Hunter Oppel on 3/17/20.
//  Copyright © 2020 LambdaSchool. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {
    
    @IBOutlet weak var poiTableView: UITableView!
    
    var poiModels: [POI] = [POI(location: "Paris", country: "France", clues: ["Saw it."])]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        poiTableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPOIModalSegue" {
            guard let newPOIVC = segue.destination as? AddPOIViewController else { return }
            
            newPOIVC.delegate = self
        } else if segue.identifier == "ShowPOIDetailSegue",
            let newPOIDVC = segue.destination as? POIDetailViewController,
            let indexPath = poiTableView.indexPathForSelectedRow {
            
            newPOIDVC.poi = poiModels[indexPath.row]
        }
    }


}

extension POIsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return poiModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = poiTableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as? POITableViewCell else {
            fatalError("Cell is not a POITableViewCell")
        }
        
        cell.poi = poiModels[indexPath.row]
        
        return cell
    }
}

extension POIsTableViewController: AddPOIDelegate {
    func poiWasAdded(_ poi: POI) {
        poiModels.append(poi)
        dismiss(animated: true, completion: nil)
        poiTableView.reloadData()
    }
}
