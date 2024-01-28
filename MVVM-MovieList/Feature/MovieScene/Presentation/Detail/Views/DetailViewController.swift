//
//  DetailViewController.swift
//  MVVM-MovieList
//
//  Created by ndyyy on 22/01/24.
//

import UIKit
import Combine

class DetailViewController: UIViewController {
    
    //MARK: Attribute
    private var detailVM: DetailViewModel!
    private var cancellable = Set<AnyCancellable>()
    
    //MARK: Collection DataSource
    private typealias DataSource = UICollectionViewDiffableDataSource<DetailViewModel.Section, Cast>
    private typealias SnapShot = NSDiffableDataSourceSnapshot<DetailViewModel.Section, Cast>
    
    private var dataSource: DataSource!
    
    
    //MARK: Subview
    private var movieImageView: UIImageView!
    private var descriptionView: DescriptionView!
    private var showInfoView: ShowInfoView!
    private var castView: CastView!
    private var scrollView: UIScrollView!
    private var containerView: UIView!
    private var containerViewHeight: NSLayoutConstraint!
    
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = .white
        setup()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        subscribe()
        fetchData()
    }
    
    init(detailVM: DetailViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.detailVM = detailVM
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//MARK: - Combine
private extension DetailViewController {
    func subscribe() {
        detailVM.casts
            .receive(on: RunLoop.main)
            .sink { casts in
                self.updateSections()
            }
            .store(in: &cancellable)
    }
    
    func fetchData() {
        Task {
            await detailVM.loadCast(movieID: detailVM.movie.id)
        }
    }
}


//MARK: - Actions
private extension DetailViewController {
    func updateSections() {
        var snapshot = SnapShot()
        snapshot.appendSections([DetailViewModel.Section.cast])
        snapshot.appendItems(detailVM.casts.value)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
    
    func configureParameters() {
        movieImageView.sd_setImage(with: detailVM.movie.mediumImage,
                                   placeholderImage: UIImage(systemName: "photo.fill")!)
        descriptionView.setParameters(for: detailVM.movie)
        showInfoView.setParameters(for: detailVM.movie)
    }
}


//MARK: - CollectionView DataSource
private extension DetailViewController {
    func configureDataSource() {
        dataSource = DataSource(collectionView: castView.castCollection, cellProvider: { collectionView, indexPath, item in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CastCell", for: indexPath) as! CastCell
            cell.setParameters(with: item)
            return cell
        })
    }
}


//MARK: - Setup
private extension DetailViewController {
    func setup() {
        setupScrollView()
        setupContainerView()
        setupMovieImageView()
        setupDescriptionView()
        setupShowInfoView()
        setupCastView()
        setupNavigationBarTitle()
        configureDataSource()
        configureParameters()
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
