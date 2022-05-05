//
//  ViaCodeCollectionViewController.swift
//  InterviewPreparation
//
//  Created by Dipakbhai Valjibhai Makwana on 05/05/22.
//

import UIKit

class ViaCodeCollectionViewController: UIViewController {
    
    

    private var collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: Constant.margin16, left: Constant.margin8, bottom: Constant.margin8, right: Constant.margin8)
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.width / 3) - (2*Constant.margin8)  , height: 200)
        
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)

        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: MovieCollectionViewCell.identifier)
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    private func configureView(){
        connfigureCollectionView()
    }
    
    private func connfigureCollectionView(){

        self.view.addSubview(collectionView)
        collectionView.configureView(superView: self.view)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

extension ViaCodeCollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.identifier, for: indexPath) as? MovieCollectionViewCell else {return MovieCollectionViewCell()}
        
        return cell 
    }
    
    
}
extension ViaCodeCollectionViewController: UICollectionViewDelegate {
    
}

class MovieCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "cell"
    
    private var lblTitle: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .systemBlue
        label.textAlignment = .left
        label.text = "KGF Chapter 2"
        return label
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setUpView(){
        self.backgroundColor = .random()
        self.addSubview(lblTitle)
        
        lblTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Constant.margin4).isActive = true
        lblTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -(Constant.margin4)).isActive = true
        lblTitle.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -(Constant.margin4)).isActive = true
        
    }
}
