//
//  UITableView+Extension.swift
//  Pargo
//
//  Created by Apple on 26/07/21.
//

import UIKit

extension UITableView {
    
    func registerHeader(identifiers:[String]){
        for identifier in identifiers {
            self.register(UINib(nibName: identifier, bundle: .main), forHeaderFooterViewReuseIdentifier: identifier)
        }
        
    }
    
    func registerCell(identifiers:[String]){
        for identifier in identifiers {
            self.register(UINib(nibName: identifier, bundle: .main), forCellReuseIdentifier: identifier)
        }
    }
    func configure(dataSource:UITableViewDataSource, delegate:UITableViewDelegate){
        
        self.showsVerticalScrollIndicator = false
        self.dataSource = dataSource
        self.delegate = delegate
        self.separatorStyle = .none
        self.rowHeight = UITableView.automaticDimension
        self.estimatedRowHeight = 100
        self.estimatedSectionHeaderHeight = 44
    }
    
    func setFooterView() {
 
        let footerView = UIView(frame:CGRect(x: 0, y: 0, width: self.frame.size.width, height: 100))
        let spiner = UIActivityIndicatorView(style: .medium)
        spiner.startAnimating()
        spiner.center = footerView.center
        footerView.addSubview(spiner)
        self.tableFooterView = footerView
    }
}


extension UICollectionView {
    
    func registerCell(identifiers:[String]){
        for identifier in identifiers {
            self.register(UINib(nibName: identifier, bundle: .main), forCellWithReuseIdentifier: identifier)
        }
    }
    
    func setLayout(gap:CGFloat = 2 ){
        let bothSideGap : CGFloat = 50
        let size = CGSize(width: (self.frame.size.width - 2*(bothSideGap)) , height: self.frame.size.height)
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: gap, bottom: 0, right: gap)
        layout.scrollDirection = .horizontal
        layout.itemSize = size
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        self.collectionViewLayout = layout
    }
    func setLayout1(wid:CGFloat){
        self.transform = CGAffineTransform(scaleX: -1, y: 1)
        let size = CGSize(width: wid , height: wid)
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.scrollDirection = .horizontal
        layout.itemSize = size
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        self.collectionViewLayout = layout
    }
    
    
}
extension UITableView {

    func setEmptyMessage(_ message: String) {
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        messageLabel.text = message
        messageLabel.textColor = .darkGray
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
      //  messageLabel.font =  Font(.installed(.HK_Medium), size: .standard(.h20)).instance
        messageLabel.sizeToFit()
        self.backgroundView = messageLabel
        self.separatorStyle = .none
    }

    func restore() {
        self.backgroundView = nil
        self.separatorStyle = .none
    }
}
