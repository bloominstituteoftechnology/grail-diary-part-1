//
//  ViewController.swift
//  GrailDiary
//
//  Created by Jarren Campos on 1/26/20.
//  Copyright © 2020 Jarren Campos. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {
    
    var myArray: [POI] = []
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
    }

}
extension POIsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}
