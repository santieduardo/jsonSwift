//
//  ViewController.swift
//  web-II
//
//  Created by Eduardo Santi on 27/06/15.
//  Copyright (c) 2015 Eduardo Santi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var repository: NSMutableArray = NSMutableArray()
    var address: String = "http://www.hrdev.com.br/projetos/posts.json"
    
    
    @IBAction func getAddress(sender: AnyObject) {
        var alertController = UIAlertController(
            title: "Endereço",
            message: "Digite o endereço",
            preferredStyle: UIAlertControllerStyle.Alert)
        
        var okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default) { (action) -> Void in
            if let textField: UITextField = alertController.textFields?.first as? UITextField {
                self.address = textField.text
                self.toWebService()
                self.tableView.reloadData()
            }
        }
        
        alertController.addTextFieldWithConfigurationHandler {
            (txt) -> Void in
            txt.placeholder = "Endereço"
            self.address = txt.text
            
        }
        
        alertController.addAction(okAction)
        
        self.presentViewController(alertController, animated: true, completion: nil)

    }
    
    func toWebService() {
        var link = NSURL(string: self.address)
        
        var data = NSData(contentsOfURL: link!)
        var error: NSError?
        
        let json: NSArray = (NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers, error: &error) as? NSArray)!
        
        if error == nil {
            for item in json {
                self.repository.addObject(Model(json: item as! NSDictionary))
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        var link = NSURL(string: self.address)
//        
//        var data = NSData(contentsOfURL: link!)
//        var error: NSError?
//        
//        let json: NSArray = (NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers, error: &error) as? NSArray)!
//        
//        if error == nil {
//            for item in json {
//                self.repository.addObject(Model(json: item as! NSDictionary))
//            }
//        }
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        
        var model = repository[indexPath.row] as! Model
        
        var title = cell.viewWithTag(10) as! UILabel
        title.text = model.titulo
        var coment = cell.viewWithTag(20) as! UILabel
        coment.text = String(model.comentarios)
        
        var author = cell.viewWithTag(30) as! UILabel
        author.text = model.nome
        
        return cell;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repository.count
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "segueDetail") {
            let detailVC: DetailViewController = segue.destinationViewController as! DetailViewController
            let indexPath = self.tableView.indexPathForSelectedRow()?.row
            detailVC.model = repository[indexPath!] as! Model
        }
    }
    


}

