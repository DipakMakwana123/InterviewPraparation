//
//  ViewController.swift
//  InterviewPreparation
//
//  Created by Apple on 23/03/22.
//

import UIKit
import Combine 
import SwiftUI
import RxSwift

class ViewController: UIViewController {
    
    private let viewModal = FirstViewModal(apiManager:APIManager())
    
    @IBOutlet weak var tableView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        configureViews()
        // apiOperations()
    }
    
    private func configureViews(){
        configureTableView()
    }
    private func configureTableView(){
        guard let table = self.tableView else {return}
        table.configure(dataSource: self,delegate: self)
        table.separatorStyle = .singleLine
        table.registerCell(identifiers: [ListTableCell.identifier])
    }
    
}
// API Operation
extension ViewController {
    private func apiOperations(){
        getEmployeesByURLSession()
        //getEmployeesByCombine()
    }
    
    private func getEmployeesByURLSession(){
        viewModal.getEmployees(compilation: {result in
            switch result {
            case .success(let employee):
                debugPrint(employee.data![0].name)
                // update UI
                break
            case.failure(let err):
                debugPrint(err)
                // handle Error
                break
            }
        })
    }
    
    
    
    private func getData(){
        
    }
}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModal.courseList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let cell = tableView.dequeueReusableCell(withIdentifier: ListTableCell.identifier, for: indexPath) as? ListTableCell,let obj = viewModal.courseList[safe:indexPath.row] else {return UITableViewCell()}
        cell.lblTitle?.text = obj.name
        
        return cell
    }
    
    
}
extension ViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let obj = viewModal.courseList[safe:indexPath.row] else {return}
        
        if obj.id == .combine {
            self.navigateToCombineVC()
        }else if obj.id == .compositionalLayout {
            self.navigateToCompositionalLayout()
        }
        else if obj.id == .tableViewCollectionView   { // SwiftUI
            self.navigateToSwiftUI_TableCollectionView()
        }
        else if  obj.id == .swiftUI  { // SwiftUI
            self.navigateToSwiftUI_SettingDetailView()
        }
        else if  obj.id == .uiKitSwiftUI  { // SwiftUI
            self.navigateToSwiftUI_SettingView()
        }
        else if  obj.id == .rxSwift  { // SwiftUI
            self.navigateToRxSwiftVC()
        }
        else if  obj.id == .liveTV  { // SwiftUI
            self.navigateToSwiftUI_LiveTVView()
        }
    }
}

extension UIViewController {
    
}

extension UIViewController{
    
    func navigateToCombineVC(){
        let viewController = CombineViewController(nibName: "CombineViewController",bundle:nil)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    func navigateToCompositionalLayout(){
        let viewController = CompositionViewController(nibName: "CompositionViewController",bundle:nil)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func navigateToRxSwiftVC(){
        let viewController = RxSwiftViewController(nibName: "RxSwiftViewController",bundle:nil)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
}

//// SWift UI Navigation
extension UIViewController{
    
    func navigateToSwiftUI_TableCollectionView(){
        let viewController = UIHostingController(rootView: TableCollectionView())
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    func navigateToSwiftUI_SettingView(){
        let viewController = UIHostingController(rootView: SettingView())
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    func navigateToSwiftUI_SettingDetailView(){
        let viewController = UIHostingController(rootView: DownloadView())
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    func navigateToSwiftUI_LiveTVView(){
        let viewController = LiveTVHostingVC(rootView: LiveTVView(selectedItem: LiveTVModal(selected: false)))
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}


