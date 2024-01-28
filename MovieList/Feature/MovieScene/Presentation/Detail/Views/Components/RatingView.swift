//
//  RatingView.swift
//  VIPER-MovieList
//
//  Created by ndyyy on 07/01/24.
//

import UIKit

class RatingView: UIView {
    private var starView: UIStackView!
    private var starLabel: UILabel!
    
    init(rating: Double) {
        super.init(frame: .zero)
        setupRatingView(rating)
        setupRatingLabel(rating)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setRating(with rating: Double) {
        starLabel.text = "\(rating)"
        addStars(rating)
    }
}

private extension RatingView {
    func setupRatingView(_ rating: Double) {
        starView = UIStackView(frame: .zero)
        starView.translatesAutoresizingMaskIntoConstraints = false
        starView.distribution = .fill
        starView.alignment = .leading
        starView.axis = .horizontal
        self.addSubview(starView)
        
        NSLayoutConstraint.activate([
            starView.topAnchor.constraint(equalTo: self.topAnchor),
            starView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            starView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    func setupRatingLabel(_ rating: Double) {
        starLabel = UILabel(frame: .zero)
        starLabel.translatesAutoresizingMaskIntoConstraints = false
        starLabel.text = "\(rating)"
        starLabel.font = UIFont.systemFont(ofSize: 18)
        self.addSubview(starLabel)
        
        NSLayoutConstraint.activate([
            starLabel.topAnchor.constraint(equalTo: self.topAnchor),
            starLabel.leadingAnchor.constraint(equalTo: starView.trailingAnchor, constant: 8),
            starLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            starLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            starLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}

//MARK: Helper
private extension RatingView {
    func addStars(_ rating: Double) {
        var total = 10 - Int(rating)
        
        // Fill the stack view with N stars
        for _ in 0..<Int(rating) {
            addStarItem(with: "star.fill")
        }
        
        //Add half star is exist
        if rating - Double(Int(rating)) > 0 {
            addStarItem(with: "star.leadinghalf.filled")
            total -= 1
        }
        
        //Add empty star
        for _ in 0..<total {
            addStarItem(with: "star")
        }
    }
    
    func addStarItem(with starName: String) {
        let starImage = UIImage(systemName: starName)!
        let star = UIImageView(image: starImage)
        star.tintColor = .systemBlue
        starView.addArrangedSubview(star)
    }
}
