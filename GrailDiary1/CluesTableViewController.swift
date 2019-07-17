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
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
	}


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
	
	
}
