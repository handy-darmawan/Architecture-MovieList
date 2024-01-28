//
//  MovieCell.swift
//  MovieList
//
//  Created by ndyyy on 27/01/24.
//

import UIKit
import SDWebImage


extension UIImageView {
    ///Implementing Grand Central Dispatch to load images asynchronously
    func loadImage(_ url: URL) {
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url),
               let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.image = image
                }
            }
        }
    }
}


class MovieCell: UITableViewCell {
    static let reuseID = "MovieCell"
    
    private(set) var image: UIImageView!
    private(set) var name: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setCellParamsFor(_ movie: Movie) {
        image.sd_setImage(with: movie.mediumImage,
                          placeholderImage: UIImage(systemName: "photo.fill")!)
        name.text = movie.name
    }
    
    private func setup() {
        setupMovieImage()
        setupMovieName()
    }
}

private extension MovieCell {
    func setupMovieImage() {
        image = UIImageView(frame: .zero)
        image.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(image)
        
        NSLayoutConstraint.activate([
            image.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            image.heightAnchor.constraint(equalToConstant: 60),
            image.widthAnchor.constraint(equalTo: image.heightAnchor, multiplier: 4/5),
            image.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    func setupMovieName() {
        name = UILabel(frame: .zero)
        name.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(name)
        
        NSLayoutConstraint.activate([
            name.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 24),
            name.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            name.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}
