//
//  JRCMovieTableViewController.swift
//  MovieSearchObjC
//
//  Created by AlphaDVLPR on 8/23/19.
//  Copyright © 2019 AlphaDVLPR. All rights reserved.
//

import UIKit

class JRCMovieTableViewController: UITableViewController, UISearchBarDelegate {

    @IBOutlet weak var searchbar: UISearchBar!
    
    var items: [JRCMovieObjects] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchbar.delegate = self
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
 
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as? JRCTableViewCell else {return UITableViewCell()}
        
        let item = items[indexPath.row]
        cell.movieObjects = item
        return cell
    }
    
    //SEARCH BAR
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        guard let searchTerm = searchBar.text,
            !searchTerm.isEmpty else {return}
        
        JRCMovieObjectController.searchForPost(searchTerm) { (movies) in
            self.items = movies
            
            //then update UI
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
}

