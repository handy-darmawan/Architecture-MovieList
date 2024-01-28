//
//  CastCell.swift
//  MovieList
//
//  Created by ndyyy on 07/01/24.
//

import UIKit
import SDWebImage

class CastCell: UICollectionViewCell {
    static let reuseID = "CastCell"
    private var castImageView: UIImageView!
    private var castNameLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setParameters(with cast: Cast) {
        castImageView.sd_setImage(with: URL(string: cast.person.image.medium)!,
                                  placeholderImage: UIImage(systemName: "photo.fill")!)
        castNameLabel.text = cast.person.name
    }
}

//MARK: Setups
private extension CastCell {
    func setup() {
        setupCastImageView()
        setupCastNameLabel()
    }
    
    func setupCastImageView() {
        castImageView = UIImageView(frame: .zero)
        castImageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(castImageView)
        
        NSLayoutConstraint.activate([
            castImageView.topAnchor.constraint(equalTo: self.topAnchor),
            castImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            castImageView.heightAnchor.constraint(equalToConstant: 80),
            castImageView.widthAnchor.constraint(equalTo: self.widthAnchor)
        ])
    }
    
    func setupCastNameLabel() {
        castNameLabel = UILabel(frame: .zero)
        castNameLabel.translatesAutoresizingMaskIntoConstraints = false
        castNameLabel.font = UIFont.systemFont(ofSize: 14)
        castNameLabel.textAlignment = .left
        castNameLabel.lineBreakMode = .byWordWrapping
        castNameLabel.numberOfLines = 0
        self.addSubview(castNameLabel)
        NSLayoutConstraint.activate([
            castNameLabel.topAnchor.constraint(equalTo: castImageView.bottomAnchor, constant: 8),
            castNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            castNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            castNameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
