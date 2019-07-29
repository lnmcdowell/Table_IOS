//
//  ViewController.swift
//  Social_Table
//
//  Created by Nathaniel Mcdowell on 7/28/19.
//  Copyright © 2019 Nathaniel Mcdowell. All rights reserved.
//

import UIKit

class MetarController: UITableViewController {

    fileprivate let CELL_ID = "CELL_ID"
    
    fileprivate var sections: [SectionData] = [
    SectionData(
        show: true,
        data: [CellData(title: "Instagram", image: UIImage(named: "shoes0")!),
               CellData(title: "Twitter", image: UIImage(named: "shoes1")!),
               CellData(title: "Else", image: UIImage(named: "shoes2")!)
        ]),
    SectionData(
        show: true,
        data: [CellData(title: "Ebay", image:UIImage(named: "shoes1")!),
               CellData(title: "Youtube", image: UIImage(named: "shoes0")!),
               CellData(title: "Netflix", image:UIImage(named: "shoes2")!)
        ])
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        navigationItem.title = "Hello"
        
        tableView.register(CustomCell.self, forCellReuseIdentifier: CELL_ID)
        tableView.allowsSelection = false
       // tableView.separatorStyle = .none
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CELL_ID, for: indexPath) as! CustomCell
        let section = sections[indexPath.section]
        let cellData = section.data[indexPath.row]
        
        cell.cellData = cellData
        
        /*
        let cell = tableView.dequeueReusableCell(withIdentifier: CELL_ID, for: indexPath)
        let section = sections[indexPath.section]
        cell.textLabel?.text = section.data[indexPath.row].title
        */
        
        
        return cell
    }
   
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
        
    }
    

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let button = UIButton()
        //new // keep track of which section is open or closed
        button.tag = section
        let itsOpen = sections[section].show
        button.setTitle(itsOpen ? "close": "open", for: .normal)
        button.setTitleColor(.black, for: .normal)
        //new
        button.addTarget(self, action: #selector(self.openSection), for: .touchUpInside)
        //button.setTitle(sections[section].open ? "open": "close", for: .normal)
        return button
    }
    
    @objc fileprivate func openSection(button:UIButton) {
        print("button tag:", button.tag)
        /*
        let section = button.tag
        
        var indexPaths = [IndexPath]()
        for row in sections[section].data.indices {
            let indexPathToDelete = IndexPath(row: row, section: section)
            indexPaths.append(indexPathToDelete)
        }
        //flip the true/false value with each button press
        let isOpen = sections[section].show
        sections[section].show = !isOpen
        */
        //tableView.reloadData() // works, but doesn't transition nicely
        //would require changing title when creating the button anew due to reloadData
        // when using delete/insert instead, you're not getting a new button, just change the
        //title of the old button
        /*
        button.setTitle(isOpen ? "open": "close", for: .normal)
        
        if isOpen {
            tableView.deleteRows(at: indexPaths, with: .fade)
        } else {
            tableView.insertRows(at: indexPaths, with: .fade)
        }
 */
    }
}

