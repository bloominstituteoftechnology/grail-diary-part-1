//
//  POIsTableViewController.swift
//  Grail Diary
//
//  Created by Percy Ngan on 8/14/19.
//  Copyright © 2019 Lamdba School. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {

	@IBOutlet weak var tableView: UITableView!

	var poi: [POI] = []



	override func viewDidLoad() {
        super.viewDidLoad()

    }
}
extension POIsTableViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return poi.count
	}
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		guard let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as? POITableViewCell else { return UITableViewCell() }

		let poi1 = poi[indexPath.row]
		cell.poi1 = poi1

		return cell
	}


	}




