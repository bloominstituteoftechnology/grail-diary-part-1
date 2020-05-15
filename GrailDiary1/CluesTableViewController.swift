//
//  ViewController.swift
//  GrailDiary1
//
//  Created by Taylor Lyles on 7/16/19.
//  Copyright © 2019 Taylor Lyles. All rights reserved.
//

import UIKit

class POISTableViewController: UIViewController {
	
	var clues: [POI] = []
	
	@IBOutlet weak var tableView: UITableView!

}

extension POISTableViewController: UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return clues.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as? POITableViewCell else { return UITableViewCell() }
		
		let clue = clues[indexPath.row]
		cell.clue = clue
		
		
		return cell
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "AddPOIModalSegue" {
			if let addClueVC = segue.destination as? AddPOIViewController {
				addClueVC.delegate = self
				}
			} else if segue.identifier == "ShowPOIDetailSegue" {
				if let indexPath =
				tableView.indexPathForSelectedRow,
					let poiDetailVC = segue.destination as? POIDetailViewController {
						poiDetailVC.poi = clues[indexPath.row]
				}
			}
		}
	}
	

extension POISTableViewController: AddPOIDelegate {
	
	func poiWasAdded(_ poi: POI) {
		clues.append(poi)
		dismiss(animated: true, completion: nil)
		tableView.reloadData()
	}
}
