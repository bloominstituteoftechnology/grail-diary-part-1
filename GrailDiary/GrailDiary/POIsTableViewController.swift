//
//  ViewController.swift
//  GrailDiary
//
//  Created by Norlan Tibanear on 5/21/20.
//  Copyright © 2020 Norlan Tibanear. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {
    
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }


} // END

extension POIsTableViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "POICell") as! POIsTableViewCell
        
        return cell
    }
    
}

