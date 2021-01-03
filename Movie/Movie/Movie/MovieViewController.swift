//
//  MovieViewController.swift
//  Movie
//
//  Created by lee on 2021/01/25.
//

import UIKit

class MovieViewController: BaseViewController<MoviewViewModel> {
    
    var movieItem :[Movie] = []
    
    let movieTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        
        viewModel = MoviewViewModel()
        
        viewModel?.movieSubject
            .subscribe(onNext: { items in
                self.movieItem = items
                self.movieTableView.reloadData()
            }).disposed(by: disposeBag)
        
        viewModel?.searchMovie(query: "어벤져스")
    }
    
    func initView() {
        movieTableView.dataSource = self
        movieTableView.delegate = self
        
        movieTableView.translatesAutoresizingMaskIntoConstraints = false
        movieTableView.register(UITableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        
        self.view.addSubview(movieTableView)
        
        self.view.addConstraint(NSLayoutConstraint(item: self.movieTableView, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1.0, constant: 1.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.movieTableView, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 1.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.movieTableView, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: 1.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.movieTableView, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1.0, constant: 1.0))
    }
}

extension MovieViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieItem.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell")! as UITableViewCell
        cell.textLabel?.text = movieItem[indexPath.row].title
        return cell
    }
}

extension MovieViewController: UITableViewDelegate {
    
}
