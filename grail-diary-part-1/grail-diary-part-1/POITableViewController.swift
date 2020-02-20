//
//  POITableViewController.swift
//  grail-diary-part-1
//
//  Created by Samuel Esserman on 2/18/20.
//  Copyright © 2020 Samuel Esserman. All rights reserved.
//


import UIKit

class POITableViewController: UIViewController {
   
    @IBOutlet weak var tableView: UITableView!
    
    var poi: [POI] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
    
    
        // Do any additional setup after loading the view.
       
}
extension POITableViewController: UITableViewDataSource {
    
}



