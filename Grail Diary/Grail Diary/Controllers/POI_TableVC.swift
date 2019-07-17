//
//  POI_TableVC.swift
//  Grail Diary
//
//  Created by Jeffrey Santana on 7/16/19.
//  Copyright © 2019 Jefffrey Santana. All rights reserved.
//

import UIKit

class POI_TableVC: UIViewController {

	@IBOutlet weak var tableview: UITableView!
	
	var points = [POI]()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		tableview.dataSource = self
	}

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if let addPOIVC = segue.destination as? AddPOI_VC {
			addPOIVC.delegate = self
		}
	}

}

extension POI_TableVC: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return points.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableview.dequeueReusableCell(withIdentifier: "AddPOIVCSegue") as? POI_Cell else {return UITableViewCell()}
		let point = points[indexPath.row]
		
		cell.point = point
		return cell
	}
}

extension POI_TableVC: AddPOIVCDelegate {
	func addedNew(point: POI) {
		points.append(point)
		dismiss(animated: true, completion: nil)
		tableview.reloadData()
	}
}
