//
//  CastView.swift
//  MovieList
//
//  Created by ndyyy on 07/01/24.
//

import UIKit

class CastView: UIView {
    private var titleLabel: UILabel!
    var castCollection: UICollectionView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: Collection Delegate
extension CastView: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 80, height: 130)
    }
}


//MARK: Setups
private extension CastView {
    func setup() {
        setupTitleLabel()
        setupCastCollection()
    }
    
    func setupTitleLabel() {
        titleLabel = UILabel(frame: .zero)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Cast"
        titleLabel.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        titleLabel.textAlignment = .left
        self.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
    }
    
    func setupCastCollection() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 5
        castCollection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        castCollection.translatesAutoresizingMaskIntoConstraints = false
        castCollection.backgroundColor = .clear
        castCollection.showsHorizontalScrollIndicator = false
        castCollection.register(CastCell.self, forCellWithReuseIdentifier: CastCell.reuseID)
        castCollection.delegate = self
        self.addSubview(castCollection)
        
        NSLayoutConstraint.activate([
            castCollection.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            castCollection.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            castCollection.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            castCollection.heightAnchor.constraint(equalToConstant: 130),
            castCollection.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
