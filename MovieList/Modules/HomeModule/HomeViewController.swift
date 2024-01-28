//
//  HomeViewController.swift
//  MovieList
//
//  Created by ndyyy on 06/01/24.
//

import UIKit

class HomeViewController: UIViewController {
    var presenter: HomeViewToPresenterProtocol!
    private var movieTableView: UITableView!
    
    override func loadView() {
        super.loadView()
        setup()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}


//MARK: Protocols
extension HomeViewController: HomePresenterToViewProtocol {
    func fetchedMovies() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            movieTableView.reloadData()
        }
    }
}


//MARK: - Table View Delegate
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.getTotalMovies()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieCell.reuseID, for: indexPath) as! MovieCell
        let movie = presenter.getMovies(with: indexPath.row)
        cell.setCellParamsFor(movie)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        90
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.onTappedMovie(with: indexPath.row)
    }
}

//MARK: Setups
extension HomeViewController {
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
        movieTableView.dataSource = self
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
