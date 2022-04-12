//
//  Table+CollectionViewController.swift
//  InterviewPreparation
//
//  Created by Dipakbhai Valjibhai Makwana on 11/04/22.
//

import UIKit

class TableCollectionViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        
    }
    private func configureViews(){
        configureTableView()
    }
    private func configureTableView(){
        guard let tableView = self.tableView else {return}
       // tableView.configure(dataSource: self, delegate: self)
        
    }
}

extension TableCollectionViewController: UITableViewDelegate {
    
}
