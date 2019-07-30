//
//  POIsTableViewController.swift
//  GrailDiary
//
//  Created by Vici Shaweddy on 7/29/19.
//  Copyright © 2019 Vici Shaweddy. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {
    var pois: [POI] = []
    
    @IBOutlet weak var poiTV: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.poiTV.dataSource = self
        self.poiTV.delegate = self
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension POIsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
}

extension POIsTableViewController: UITableViewDelegate {
    
}
