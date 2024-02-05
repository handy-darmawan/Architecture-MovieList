//
//  ShowInfoView.swift
//  MovieList
//
//  Created by ndyyy on 07/01/24.
//

import UIKit

class ShowInfoView: UIView {
    private(set) var titleLabel: UILabel!
    private var containerView: UIView!
    private(set) var scheduleLabel: UILabel!
    private(set) var statusLabel: UILabel!
    private(set) var typeLabel: UILabel!
    private(set) var genreLabel: UILabel!
    private(set) var ratingView: RatingView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    func setParameters(for movie: Movie) {
        let scheduleText = "Schedule : \(movie.schedule.days.map({$0.rawValue}).joined(separator: ", ")) at \(movie.schedule.time.rawValue) (\(movie.averageRuntime) min)"
        scheduleLabel.attributedText = scheduleText.boldLabelWithLength()
        
        let statusText = "Status : \(movie.status.rawValue)"
        statusLabel.attributedText = statusText.boldLabelWithLength()
        
        let typeText = "Type : \(movie.type.rawValue)"
        typeLabel.attributedText = typeText.boldLabelWithLength()
        
        let genreText = "Genres : "
        genreLabel.attributedText = genreText.boldLabelAndColoringGenre(items: movie.genres)
        
        ratingView.setRating(with: movie.rating.average ?? 0.0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//MARK: Setups
private extension ShowInfoView {
    func setup() {
        setupTitleLabel()
        setupContainerView()
        setupScheduleLabel()
        setupStatusLabel()
        setupTypeLabel()
        setupGenreLabel()
        setupRatingView(with: 0.0)
    }
    
    func setupTitleLabel() {
        titleLabel = UILabel(frame: .zero)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Show Info"
        titleLabel.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        titleLabel.textAlignment = .left
        self.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor)
        ])
    }
    
    func setupContainerView() {
        containerView = UIView(frame: .zero)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = UIColor.showInfoBGColor
        containerView.layer.shadowColor = UIColor.gray.cgColor
        containerView.layer.shadowRadius = 5
        containerView.layer.shadowOpacity = 0.5
        containerView.layer.shadowOffset = CGSize(width: 0, height: 0)
        containerView.layer.cornerRadius = 4
        self.addSubview(containerView)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    func setupScheduleLabel() {
        scheduleLabel = UILabel(frame: .zero)
        setupContentReuseable(for: &scheduleLabel, topHook: containerView.topAnchor, parent: containerView)
    }
    
    func setupStatusLabel() {
        statusLabel = UILabel(frame: .zero)
        setupContentReuseable(for: &statusLabel, topHook: scheduleLabel.bottomAnchor, parent: containerView)
    }
        
    func setupTypeLabel() {
        typeLabel = UILabel(frame: .zero)
        setupContentReuseable(for: &typeLabel, topHook: statusLabel.bottomAnchor, parent: containerView)
    }
    
    func setupGenreLabel() {
        genreLabel = UILabel(frame: .zero)
        setupContentReuseable(for: &genreLabel, topHook: typeLabel.bottomAnchor, parent: containerView)
    }
    
    func setupRatingView(with value: Double) {
        ratingView = RatingView(rating: value)
        setupContentReuseable(for: &ratingView, topHook: genreLabel.bottomAnchor, parent: containerView)
        
        NSLayoutConstraint.activate([
            ratingView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
    }
    
    func setupContentReuseable<T: UIView>(for content: inout T, topHook topContent: NSLayoutAnchor<NSLayoutYAxisAnchor>, parent parentView: UIView) {
        content.translatesAutoresizingMaskIntoConstraints = false
        parentView.addSubview(content)
        
        NSLayoutConstraint.activate([
            content.topAnchor.constraint(equalTo: topContent, constant: 4),
            content.leadingAnchor.constraint(equalTo: parentView.leadingAnchor, constant: 8),
            content.trailingAnchor.constraint(equalTo: parentView.trailingAnchor, constant: -8),
        ])
    }
}
