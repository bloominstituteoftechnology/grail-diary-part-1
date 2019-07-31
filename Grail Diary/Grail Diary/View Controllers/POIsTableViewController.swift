//
//  POIsTableViewController.swift
//  Grail Diary
//
//  Created by Jessie Ann Griffin on 7/30/19.
//  Copyright © 2019 Jessie Griffin. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {

    var poiList: [POI] = []
    
    @IBOutlet weak var poiListTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "AddPOIModalSegue" {
            
            if let addPOIVC = segue.destination as? AddPOIViewController {
                
                addPOIVC.delegate = self
            }
        } else if segue.identifier == "ShowPOIDetailSegue" {
            
            if let indexPath = self.poiListTableView.indexPathForSelectedRow?.row, let showDetailVC = segue.destination as? POIDetailViewController {
                show
            }
        }
    }

}

extension POIsTableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return poiList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = poiListTableView.dequeueReusableCell(withIdentifier: "pointOfInterestCell", for: indexPath) as? POITableViewCell else { return UITableViewCell() }
        
        let poi = poiList[indexPath.row]
        cell.poi = poi
        return cell
    }
}

extension POIsTableViewController: AddPOIDelegate {
    func poiWasAdded(_ poi: POI) {
        poiList.append(poi)
        dismiss(animated: true, completion: nil)
        poiListTableView.reloadData()
    }
}
