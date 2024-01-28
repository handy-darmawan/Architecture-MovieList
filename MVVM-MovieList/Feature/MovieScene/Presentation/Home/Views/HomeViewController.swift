//
//  HomeViewController.swift
//  MVVM-MovieList
//
//  Created by ndyyy on 22/01/24.
//

import UIKit
import Combine

class HomeViewController: UIViewController {
    
    //MARK: Attribute
    var homeVM = HomeViewModel()
    private var cancellable = Set<AnyCancellable>()
    
    //MARK: Table DataSource
    private typealias DataSource = UITableViewDiffableDataSource<HomeViewModel.Section, Movie>
    private typealias SnapShot = NSDiffableDataSourceSnapshot<HomeViewModel.Section, Movie>
    
    private var dataSource: DataSource!
    
    //MARK: Subview
    private var movieTableView: UITableView!
    
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
}


//MARK: - Combine
private extension HomeViewController {
    func subscribe() {
        homeVM.movies
            .receive(on: RunLoop.main)
            .sink { movies in
                self.updateSections()
            }
            .store(in: &cancellable)
    }
    
    func fetchData() {
        Task {
            await homeVM.loadMovies()
        }
    }
}


//MARK: - Setup
private extension HomeViewController {
    func setup() {
        setupTableView()
        setupNavigationBarTitle()
        configureDataSource()
    }
    
    func setupTableView() {
        movieTableView = UITableView()
        movieTableView.translatesAutoresizingMaskIntoConstraints = false
        movieTableView.backgroundColor = .clear
        movieTableView.delegate = self
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
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "All Movies"
    }
}


//MARK: - Actions
private extension HomeViewController {
    func updateSections() {
        var snapshot = SnapShot()
        snapshot.appendSections([HomeViewModel.Section.movies])
        snapshot.appendItems(homeVM.movies.value)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
}


//MARK: - TableView DataSource & Delegate
extension HomeViewController: UITableViewDelegate {
    func configureDataSource() {
        dataSource = DataSource(tableView: movieTableView, cellProvider: { tableView, indexPath, movie in
            let cell = tableView.dequeueReusableCell(withIdentifier: MovieCell.reuseID, for: indexPath) as! MovieCell
            cell.setCellParamsFor(movie)
            
            return cell
        })
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        90
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVM = DetailViewModel(movie: homeVM.movies.value[indexPath.row])
        let detailVC = DetailViewController(detailVM: detailVM)
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}
