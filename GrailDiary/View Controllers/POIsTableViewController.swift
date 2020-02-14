//
//  POIsTableViewController.swift
//  GrailDiary
//
//  Created by Matthew Martindale on 1/30/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController, UITableViewDelegate {
    
    var pois: [POI] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.grailDiaryTableView.delegate = self
        self.grailDiaryTableView.dataSource = self
    }

    @IBOutlet weak var grailDiaryTableView: UITableView!
    
}

extension POIsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pois.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell =
            tableView.dequeueReusableCell(withIdentifier: "diaryCell", for: indexPath) as?
            POITableViewCell else { return UITableViewCell() }
        
        let poi  = pois[indexPath.row]
        cell.poi = poi
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPOIModalSegue" {
            let addPOIvc = segue.destination as!
            AddPOIViewController
            addPOIvc.delegate = self
            }
        else if segue.identifier == "ShowPOIDetailSegue" {
            let detailPOIvc = segue.destination as!
            POIDetailViewController
            guard let indexPath = grailDiaryTableView.indexPathForSelectedRow else { return }
            let poi = pois[indexPath.row]
            detailPOIvc.poi = poi
        }
    }
}

extension POIsTableViewController: AddPOIDelegate {
    func poiWasAdded(_ poi: POI) {
        pois.append(poi)
        grailDiaryTableView.reloadData()
    }
    
    
}
