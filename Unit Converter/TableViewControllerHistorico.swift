//
//  TableViewControllerHistorico.swift
//  Unit Converter
//
//  Created by Carlos Filipe Pinto de Oliveira on 25/12/15.
//  Copyright © 2015 Carlos Filipe Pinto de Oliveira. All rights reserved.
//

import UIKit

class TableViewControllerHistorico: UITableViewController {

    var TabConversoes : [Conversao] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ler()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    func gravar() {
        let documents = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
        
        let writePath = documents.URLByAppendingPathComponent("file.dat").path!
        
        NSKeyedArchiver.archiveRootObject(TabConversoes, toFile: writePath)
    }
    
    func ler() {
        let documents = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
        
        let readPath = documents.URLByAppendingPathComponent("file.dat").path!
        
        let tab = NSKeyedUnarchiver.unarchiveObjectWithFile(readPath)
        
        if tab != nil {
            TabConversoes = tab as! [Conversao]
        } else {
            TabConversoes = []
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return TabConversoes.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cellHistorico", forIndexPath: indexPath)
        let c : Conversao = TabConversoes[indexPath.row]
        cell.textLabel?.text = c.valorOriginal! + " " + c.origem!
        cell.textLabel?.text = (cell.textLabel?.text!)! + " = " + c.valorFinal! + " " + c.destino!
        //cell.detailTextLabel?.text = c.medida!
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
