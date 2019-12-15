//
//  POIsTableViewController.swift
//  GrailDiary
//
//  Created by Lambda_School_loaner_226 on 12/14/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController
{

    @IBOutlet weak var tableView: UITableView!
    
    var poiArray: [POI] = []
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()

    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        // Get the new view controller using segue.destination.
        if segue.identifier == "AddPOIModalSegue"
        {
            // Pass the selected object to the new view controller.
            if let destination = segue.destination as? AddPOIViewController
            {
                destination.delegate = self
            }
            else if segue.identifier == "ShowPOIDetailSegue"
            {
                if let destination = segue.destination as? POIDetailViewController
                {
                    if let indexPath = tableView.indexPathForSelectedRow
                    {
                       destination.poi = self.poiArray[indexPath.row]
                    }
                }
            }
        }
    }
}

extension POIsTableViewController: UITableViewDataSource, UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return poiArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as? POITableViewCell else {return(UITableViewCell())}
        
        cell.poi = self.poiArray[indexPath.row]
        
        return cell
        
        
        
    }
}

extension POIsTableViewController: AddPOIDelegate
{
    func poiWasAdded(_ poi: POI)
    {
        poiArray.append(poi)
        self.dismiss(animated: true, completion: nil)
        tableView.reloadData()
    }
}
