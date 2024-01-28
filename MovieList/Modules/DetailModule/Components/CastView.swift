//
//  CastView.swift
//  MovieList
//
//  Created by ndyyy on 07/01/24.
//

import UIKit

class CastView: UIView {
    private var titleLabel: UILabel!
    private var castCollection: UICollectionView!
    var getCastCount: () -> Int
    var getCast: (Int) -> Cast
    
    init(frame: CGRect, getCastCount: @escaping () -> Int, getCast: @escaping (Int) -> Cast) {
        self.getCastCount = getCastCount
        self.getCast = getCast
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//MARK: Actions {
extension CastView {
    func reloadData() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            castCollection.reloadData()
        }
    }
}


//MARK: Collection Delegate
extension CastView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        getCastCount()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = castCollection.dequeueReusableCell(withReuseIdentifier: CastCell.reuseID, for: indexPath) as! CastCell
        let cast = getCast(indexPath.row)
        cell.setParameters(with: cast)
        return cell
    }
    
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
        castCollection.dataSource = self
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
