//
//  POIsTableViewController.swift
//  GrailDiary
//
//  Created by Zack Larsen on 11/7/19.
//  Copyright © 2019 Zack Larsen. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var placesOfInterest: [POI] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        return
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
}
