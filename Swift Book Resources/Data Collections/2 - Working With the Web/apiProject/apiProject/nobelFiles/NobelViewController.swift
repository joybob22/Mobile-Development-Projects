//
//  NobelViewController.swift
//  apiProject
//
//  Created by Brayden Lemke on 11/29/21.
//

import UIKit

class NobelViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

    var nobelController = NobelController()
    
    //nobelData will hold the data just as it appeared in the JSON
    var nobelData: [NobelCategory] = []
    
    //tableData will hold just the data needed for each table cell
    //I had to have a seperate array to "merge" both the "category" and the "winner" into a single data type. Which I call NobelTableData.
    //Since arrays can only have one type and you can only use one array per table view this is the solution I came up with.
    //Pretty sure there is a better way to do it and would love feedback!
    var tableData: [NobelTableData] = []
    
    //Named it parentTableView because of my original idea where I was going to have the parent table view with child table views within each cell.
    //Thanks for steering me away from that idea!
    @IBOutlet weak var parentTableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        parentTableView.delegate = self
        parentTableView.dataSource = self
        searchBar.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //Here I check to see if we are dealing with a category or a person within a category.
        //Depending on what is decided I create a cell based on that type.
        
        if tableData[indexPath.row].isParent {
            let cell = parentTableView.dequeueReusableCell(withIdentifier: "NobelParentCell", for: indexPath) as! NobelParentTableViewCell
            cell.configureCell(nobelData: tableData[indexPath.row])
            return cell
        } else {
            let cell = parentTableView.dequeueReusableCell(withIdentifier: "NobelChildCell", for: indexPath) as! NobelChildTableViewCell
            cell.configureCell(nobelWinner: tableData[indexPath.row])
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        parentTableView.deselectRow(at: indexPath, animated: true)
        
        let parentCell = parentTableView.cellForRow(at: indexPath) as? NobelParentTableViewCell
        
        //Only do something if we selected a parent/category cell
        
        if let parentCell = parentCell, let parentCellLabel = parentCell.categoryLabel.text {
            var categoryIndex: Int?
            
            //Find the category in the nobelData array
            
            for (index, category) in nobelData.enumerated() {
                if category.category == parentCellLabel {
                    categoryIndex = index
                }
            }
            
            //Unwrap optional values of the specified category
            
            if let categoryIndex = categoryIndex, let isSelected = nobelData[categoryIndex].isSelected {
                if !isSelected {
                    //Show rows
                    nobelData[categoryIndex].isSelected = true
                    for (index, person) in nobelData[categoryIndex].laureates.enumerated() {
                        tableData.insert(NobelTableData(label: "\(person.firstname) \(person.surname)", isParent: false, isSelected: false), at: indexPath.row + index + 1)
                        parentTableView.insertRows(at: [IndexPath(row: indexPath.row + index + 1, section: 0)], with: .fade)
                    }
                } else {
                    //Delete rows
                    nobelData[categoryIndex].isSelected = false
                    for _ in nobelData[categoryIndex].laureates {
                        tableData.remove(at: indexPath.row + 1)
                        parentTableView.deleteRows(at: [IndexPath(row: indexPath.row + 1, section: 0)], with: .fade)
                    }
                }
            }
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let searchText = searchBar.text {
            nobelController.fetchData(year: searchText) { result in
                switch result {
                case .success(let categories):
                    //Keeping the data intact as it came in from the API.
                    self.nobelData = categories
                    
                    //Emptying the tableData array if the user already made a search
                    if !self.tableData.isEmpty {
                        self.tableData = []
                    }
                    
                    //Create the data needed to populate the table using the merged type "NobelTableData".
                    //At this point it will just be the categories being added.
                    for category in categories {
                        self.tableData.append(NobelTableData(label: category.category, isParent: true, isSelected: false))
                    }
                    
                    for (index, _) in self.self.nobelData.enumerated() {
                        //For some reason my default value of false that I defined in the struct definition wasn't being applied so I did it manually here
                        self.nobelData[index].isSelected = false
                    }
                    
                    DispatchQueue.main.async {
                        self.parentTableView.reloadData()
                    }
                case .failure(let err):
                    print(err.localizedDescription)
                }
            }
        }
    }
    

}
