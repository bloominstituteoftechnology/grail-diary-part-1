//
//  POIsTableViewController.swift
//  GrailDiary
//
//  Created by Matthew Martindale on 1/30/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController, UITableViewDelegate {
    
    let poi: [POI] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.grailDiaryTableView.delegate = self
        self.grailDiaryTableView.dataSource = self
    }

    @IBOutlet weak var grailDiaryTableView: UITableView!
    
}

extension POIsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return poi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
