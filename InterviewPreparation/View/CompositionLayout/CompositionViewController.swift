//
//  CompositionViewController.swift
//  InterviewPreparation
//
//  Created by Apple on 01/04/22.
//

import UIKit

class CompositionViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }
    private func configureViews(){
        configureCollectionView()
    }
    private func configureCollectionView(){
        guard let collectionView = collectionView else {return}
        
        collectionView.collectionViewLayout = setLayout()
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    private func setLayout() -> UICollectionViewCompositionalLayout{
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }


}

extension CompositionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = UIColor.red
        return cell
    }
    
    
}
extension CompositionViewController: UICollectionViewDelegateFlowLayout {
    
}



