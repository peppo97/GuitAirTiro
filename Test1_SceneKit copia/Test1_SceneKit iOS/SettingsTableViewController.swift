//
//  SettingsTableViewController.swift
//  LetsPlayStoryboards
//
//  Created by Christian Marino on 16/07/2019.
//  Copyright © 2019 Christian Marino. All rights reserved.
//

import UIKit


class SettingsTableViewController: UITableViewController {
    
    @IBOutlet var tvSettingsCell: UITableViewCell!
    @IBOutlet var tvSettingsLabel: UILabel!
    
    
    let actLang = "Italiano";
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 2
    }
    /*
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell: UITableViewCell?
     switch indexPath.row {
     case 0:
     cell = tableView.dequeueReusableCell(withIdentifier: "tv_settings",for: indexPath)
     tvSettingsCell = cell
     case 1:
     cell = tableView.dequeueReusableCell(withIdentifier: "notation_settings",for: indexPath)
     default:
     cell = nil
     }
     
     // Configure the cell...
     
     return cell!
     }
     */
    
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    
    
}

