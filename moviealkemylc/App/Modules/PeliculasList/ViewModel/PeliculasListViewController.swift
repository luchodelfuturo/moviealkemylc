//
//  PeliculasListViewController.swift
//  peliculas-alkemy
//
//  Created by Luciano Federico Castro on 19/07/2022.
//

import Foundation
import UIKit


protocol PeliculasListDelegate {
    func reloadTable()
    func showError(error: String)
}

class PeliculasListViewController: UIViewController {

    private var service = PeliculasListService()
    private var viewModel: PeliculasListViewModel?
    
    private lazy var tableView: UITableView = {
        let aTable = UITableView()
        aTable.translatesAutoresizingMaskIntoConstraints = false
        aTable.delegate = self
        aTable.dataSource = self
        aTable.register(PeliculasListTableViewCell.self, forCellReuseIdentifier: String(describing: PeliculasListTableViewCell.self))
        view.addSubview(aTable)
        return aTable
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        self.viewModel = PeliculasListViewModel(service: service, delegate: self)
        self.viewModel?.getPeliculas()
    }
    
    private func setupView (){
        title = "Peliculas Populares"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .blue
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor)
        ])
        
    }
    
}

extension PeliculasListViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = PeliculasDetailViewController()
        let pelicula = self.viewModel?.getPeliculas(at: indexPath.row)
        detailViewController.peliculaID = pelicula!.id
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }

}

extension PeliculasListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel?.getPeliculasCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PeliculasListTableViewCell.self), for: indexPath) as? PeliculasListTableViewCell else {
            return UITableViewCell()
        }
        let pelicula = self.viewModel?.getPeliculas(at: indexPath.row)
        cell.name = pelicula?.title.capitalized
        let url = "https://image.tmdb.org/t/p/w600_and_h900_bestv2\(pelicula!.posterPath)"
        cell.placeholderImage.setImage(url: url)
        
      
      
        
        
       
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 164
    }

}

extension PeliculasListViewController: PeliculasListDelegate {
    
    func reloadTable() {
        self.tableView.reloadData()
    }
    
    func showError(error: String) {
        print("Algo fallo,", error)
    }
    
}
