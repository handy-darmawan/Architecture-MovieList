//
//  DetailViewController.swift
//  MovieList
//
//  Created by ndyyy on 06/01/24.
//

import UIKit
import SDWebImage

class DetailViewController: UIViewController {
    var presenter: DetailViewToPresenterProtocol!
    
    //MARK: Subviews
    private var movieImageView: UIImageView!
    private var descriptionView: DescriptionView!
    private var showInfoView: ShowInfoView!
    private var castView: CastView!
    private var scrollView: UIScrollView!
    private var containerView: UIView!
    private var containerViewHeight: NSLayoutConstraint!
    
    //MARK: Data source
    enum Section { case cast }
    private var dataSource: UICollectionViewDiffableDataSource<Section, Cast>!
    private var snapshot: NSDiffableDataSourceSnapshot<Section, Cast>!
    
    
    override func loadView() {
        super.loadView()
        setup()
        configureDataSource()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

//MARK: Protocols
extension DetailViewController: DetailPresenterToViewProtocol {
    func fetchedCast() {
        updateSections()
    }
    
    func fetchedMovie(_ movie: Movie) {
        movieImageView.sd_setImage(with: URL(string: movie.image.medium)!,
                                   placeholderImage: UIImage(systemName: "photo.fill")!)
        descriptionView.setParameters(for: movie)
        showInfoView.setParameters(for: movie)
    }
}


//MARK: Actions
extension DetailViewController {
    func updateSections() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Cast>()
        snapshot.appendSections([.cast])
        snapshot.appendItems(presenter.getCasts())
        dataSource.apply(snapshot)
    }
}


//MARK: - Data Source
extension DetailViewController {
    func configureDataSource() {
        dataSource = .init(collectionView: castView.castCollection, cellProvider: { collectionView, indexPath, cast in
            let cell = self.castView.castCollection.dequeueReusableCell(withReuseIdentifier: CastCell.reuseID, for: indexPath) as! CastCell
            cell.setParameters(with: cast)
            return cell
        })
    }
}


//MARK: Setups
extension DetailViewController {
    func setup() {
        view.backgroundColor = .white
        overrideUserInterfaceStyle = .light
        setupScrollView()
        setupContainerView()
        setupMovieImageView()
        setupDescriptionView()
        setupShowInfoView()
        setupCastView()
        setupNavigationBarTitle()
    }
    
    func setupScrollView() {
        scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    func setupContainerView() {
        containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(containerView)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -32),
        ])
        
        containerViewHeight = containerView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        containerViewHeight.isActive = true
        containerViewHeight.priority = UILayoutPriority(1)
    }
    
    func setupMovieImageView() {
        movieImageView = UIImageView()
        movieImageView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(movieImageView)
        
        NSLayoutConstraint.activate([
            movieImageView.topAnchor.constraint(equalTo: containerView.topAnchor),
            movieImageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            movieImageView.heightAnchor.constraint(equalToConstant: 200),
            movieImageView.widthAnchor.constraint(equalTo: movieImageView.heightAnchor, multiplier: 16/9)
        ])
    }
    
    func setupDescriptionView() {
        descriptionView = DescriptionView(frame: .zero)
        descriptionView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(descriptionView)
        
        NSLayoutConstraint.activate([
            descriptionView.topAnchor.constraint(equalTo: movieImageView.bottomAnchor, constant: 8),
            descriptionView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            descriptionView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
        ])
    }
    
    func setupShowInfoView() {
        showInfoView = ShowInfoView(frame: .zero)
        showInfoView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(showInfoView)
        
        NSLayoutConstraint.activate([
            showInfoView.topAnchor.constraint(equalTo: descriptionView.bottomAnchor, constant: -32),
            showInfoView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            showInfoView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
        ])
    }
    
    func setupCastView() {
        castView = CastView(frame: .zero)
        castView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(castView)
        
        NSLayoutConstraint.activate([
            castView.topAnchor.constraint(equalTo: showInfoView.bottomAnchor, constant: 16),
            castView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            castView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            castView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
    }
    
    func setupNavigationBarTitle() {
        self.navigationItem.title = "Show"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "Back", style: .done, target: nil, action: nil)
        
        //show the navigation bar
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .white
        self.navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
}
