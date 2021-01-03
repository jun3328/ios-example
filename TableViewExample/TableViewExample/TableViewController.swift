//
//  ViewController.swift
//  TableViewExample
//
//  Created by lee on 2020/09/15.
//  Copyright © 2020 lee. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, AddItemDelegate {
    
    var items = ["도서 구매", "강의 시청", "스터디 준비"]
    
    var itemsImage = ["cart.png", "clock.png", "pencil.png"]
    
    
    @IBOutlet var listView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        listView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        let rowPosition = (indexPath as NSIndexPath).row
        
        cell.textLabel?.text = items[rowPosition]
        cell.imageView?.image = UIImage(named: itemsImage[rowPosition])
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            items.remove(at: (indexPath as NSIndexPath).row)
            itemsImage.remove(at: (indexPath as NSIndexPath).row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            //
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "삭제"
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let sourceIndex = (sourceIndexPath as NSIndexPath).row
        let destinationIndex = (destinationIndexPath as NSIndexPath).row
        
        let itemToMove = items[sourceIndex]
        let itemImageToMove = itemsImage[sourceIndex]
        
        items.remove(at: sourceIndex)
        itemsImage.remove(at: sourceIndex)
        
        items.insert(itemToMove, at: destinationIndex)
        itemsImage.insert(itemImageToMove, at: destinationIndex)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "sgDetail":
            let cell = sender as! UITableViewCell
            let indexPath = self.listView.indexPath(for: cell)
            let detailView = segue.destination as! DetailViewController
            detailView.receiveItem(items[(indexPath! as NSIndexPath).row])
            break
        case "sgAdd":
            let addView = segue.destination as! AddViewController
            addView.addDelegate = self
            break
        default:
            break
        }
    }
    
    func addItem(item: String, image: String) {
        items.append(item)
        itemsImage.append(image)
    }
}

