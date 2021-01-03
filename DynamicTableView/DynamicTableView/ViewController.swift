//
//  ViewController.swift
//  DynamicTableView
//
//  Created by lee on 2021/01/24.
//

import UIKit

class ViewController: UIViewController {
    
    let myTableView = UITableView()
    
    let contentArr = ["Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book",
                      "It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.", "It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.", "The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.", "There are many variations of passages of Lorem Ipsum available,"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.translatesAutoresizingMaskIntoConstraints = false
        
        //let myTableViewCell = UINib(nibName: "MyTableViewCell", bundle: nil)
        let myTableViewCell = UINib(nibName: String(describing: MyTableViewCell.self), bundle: nil)
        
        myTableView.register(myTableViewCell, forCellReuseIdentifier: "myTableViewCell")
        myTableView.rowHeight = UITableView.automaticDimension
        myTableView.estimatedRowHeight = 120

        self.view.addSubview(myTableView)
        
        addConstraint(attr: .top)
        addConstraint(attr: .bottom)
        addConstraint(attr: .leading)
        addConstraint(attr: .trailing)
    }

    func addConstraint(attr: NSLayoutConstraint.Attribute) {
        let constraint = NSLayoutConstraint(item: self.myTableView, attribute: attr, relatedBy: .equal, toItem: self.view, attribute: attr, multiplier: 1.0, constant: 0)
        self.view.addConstraint(constraint)
    }
}

extension ViewController : UITableViewDelegate {
    
}

extension ViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myTableViewCell") as! MyTableViewCell
        cell.userContent.text = contentArr[indexPath.row]
        return cell
    }
}
