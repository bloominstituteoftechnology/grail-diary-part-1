//
//  ViewController.swift
//  GrailDiary
//
//  Created by Enrique Gongora on 1/21/20.
//  Copyright © 2020 Enrique Gongora. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {
    
    @IBOutlet weak var diaryTableView: UITableView!
    var pois: [POI] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        diaryTableView.dataSource = self
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPOIModalSegue"{
            guard let addPOIVC = segue.destination as? AddPOIViewController else { return }
            addPOIVC.delegate = self
        }else if segue.identifier == "ShowPOIDetailSegue"{
            if let indexPath = diaryTableView.indexPathForSelectedRow, let showPOIVC = segue.destination as? POIDetailViewController{
                showPOIVC.poi = pois[indexPath.row]
            }
        }
    }
}

extension POIsTableViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pois.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as? POITableViewCell else { return UITableViewCell() }
        
        let poiCell = pois[indexPath.row]
        cell.poi = poiCell
        return cell
    }
}

extension POIsTableViewController: AddPOIDelegate{
    func poiWasAdded(_ poi: POI) {
        pois.append(poi)
        dismiss(animated: true, completion: nil)
        diaryTableView.reloadData()
    }
}
