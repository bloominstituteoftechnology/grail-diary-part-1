//
//  POIsTableViewController.swift
//  Grail-Diary
//
//  Created by Marlon Raskin on 7/17/19.
//  Copyright © 2019 Marlon Raskin. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {

	var poiArray: [POI] = []
	
	@IBOutlet weak var tableView: UITableView!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		tableView.dataSource = self
		tableView.tableFooterView = UIView()
    }
}


extension POIsTableViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return poiArray.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: "GrailCell", for: indexPath) as? POITableViewCell else { return UITableViewCell() }
		let poi = poiArray[indexPath.row]
		cell.poi = poi
		return cell
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "AddPOIModalSegue" {
			if let addPOIVC = segue.destination as? AddPOIViewController {
				addPOIVC.delegate = self
			}
		} else if segue.identifier == "ShowPOIDetailSegue" {
			if let indexPath = tableView.indexPathForSelectedRow,
				let detailVC = segue.destination as? POIDetailViewController {
				detailVC.poi = poiArray[indexPath.row]
			}
		}
	}
}


extension POIsTableViewController: AddPOIDelegate {
	func poiWasAdded(_ poi: POI) {
		poiArray.append(poi)
		dismiss(animated: true, completion: nil)
		tableView.reloadData()
	}
	
}
