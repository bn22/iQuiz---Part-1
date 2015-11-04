//
//  ViewController.swift
//  iQuiz Part1
//
//  Created by Bruce Ng on 11/3/15.
//  Copyright © 2015 Bruce Ng. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    let cellTableIdentifier = "subjectCell"
    let subjects = [
        ["Name" : "Mathematics", "Description" : "Get quizzed about math", "Photo" : "photo1.png"],
        ["Name" : "Marvel Super Heroes", "Description" : "Get quizzed about Marvel", "Photo" : "photo2.png"],
        ["Name" : "Science", "Description" : "Get quizzed about science stuff", "Photo" : "photo3.png"],
    ];

    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backView = UIView(frame: CGRectZero)
        self.tableView.tableFooterView = backView
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subjects.count
    }
    
    func tableView(tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath)
        -> UITableViewCell {
            let cell = tableView.dequeueReusableCellWithIdentifier(cellTableIdentifier, forIndexPath: indexPath)
                as! subjectCell
        let rowData = subjects[indexPath.row]
        cell.title = rowData["Name"]!
        cell.descript = rowData["Description"]!
        cell.imageLabel?.image = UIImage(named: rowData["Photo"]!)
        cell.subject = "Subject:"
        return cell
    }

    @IBAction func showSettings(sender: AnyObject) {
        let alert = UIAlertController(title: "Alert", message: "Settings go here", preferredStyle: UIAlertControllerStyle.Alert)
        let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
        alert.addAction(ok);
        self.presentViewController(alert, animated: true, completion: nil)
    }
}

