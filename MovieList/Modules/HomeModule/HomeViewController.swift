//
//  HomeViewController.swift
//  MovieList
//
//  Created by ndyyy on 06/01/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    var presenter: HomeViewToPresenterProtocol!
    private(set) var movieTableView: UITableView!
    
    //MARK: Data source
    enum Section { case movie }
    private var dataSource: UITableViewDiffableDataSource<Section, Movie>!
    private var snapshot: NSDiffableDataSourceSnapshot<Section, Movie> = NSDiffableDataSourceSnapshot<Section, Movie>()
    
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
extension HomeViewController: HomePresenterToViewProtocol {
    func fetchedMovies() {
        //update the snapshot
        updateSections()
    }
}


//MARK: - Actions
extension HomeViewController {
    func updateSections() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Movie>()
        snapshot.appendSections([.movie])
        snapshot.appendItems(presenter.getMovies())
        dataSource.apply(snapshot, animatingDifferences: true)
    }
}


//MARK: - Data Source
private extension HomeViewController {
    func configureDataSource() {
        dataSource = .init(tableView: movieTableView, cellProvider: { tableView, indexPath, movie in
            let cell = tableView.dequeueReusableCell(withIdentifier: MovieCell.reuseID, for: indexPath) as! MovieCell
            cell.setCellParamsFor(movie)
            return cell
        })
    }
}


//MARK: - Table View Delegate
extension HomeViewController: UITableViewDelegate {
  
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        90
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.onTappedMovie(with: indexPath.row)
    }
}

//MARK: Setups
private extension HomeViewController {
    func setup() {
        view.backgroundColor = .white
        overrideUserInterfaceStyle = .light
        setupMovieTableView()
        setupNavigationBarTitle()
    }
    
    func setupMovieTableView() {
        movieTableView = UITableView()
        movieTableView.translatesAutoresizingMaskIntoConstraints = false
        movieTableView.delegate = self
        movieTableView.backgroundColor = .clear
        movieTableView.register(MovieCell.self, forCellReuseIdentifier: MovieCell.reuseID)
        view.addSubview(movieTableView)
        
        NSLayoutConstraint.activate([
            movieTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            movieTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            movieTableView.topAnchor.constraint(equalTo: view.topAnchor),
            movieTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    func setupNavigationBarTitle() {
        self.navigationItem.title = "All Movies"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
}
