//
//  DescriptionView.swift
//  VIPER-MovieList
//
//  Created by ndyyy on 07/01/24.
//

import UIKit

class DescriptionView: UIView {
    private var titleLabel: UILabel!
    private var summaryLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setParameters(for movie: Movie) {
        titleLabel.text = movie.name
        summaryLabel.attributedText = movie.summary.convertHTMLToAttributedString()!
    }
    
    private func setup() {
        setupTitleLabel()
        setupSummaryLabel()
    }
}


//MARK: Setups
private extension DescriptionView {
    func setupTitleLabel() {
        titleLabel = UILabel(frame: .zero)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = .systemFont(ofSize: 24, weight: .bold)
        titleLabel.textAlignment = .left
        self.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
    }
    
    func setupSummaryLabel() {
        summaryLabel = UILabel(frame: .zero)
        summaryLabel.translatesAutoresizingMaskIntoConstraints = false
        summaryLabel.textAlignment = .left
        summaryLabel.lineBreakMode = .byWordWrapping
        summaryLabel.numberOfLines = 0
        self.addSubview(summaryLabel)
        
        NSLayoutConstraint.activate([
            summaryLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            summaryLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            summaryLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            summaryLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
        ])
    }
}
