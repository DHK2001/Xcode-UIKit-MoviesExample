//
//  ListOfMoviesView.swift
//  Architecture_VIper
//
//  Created by Derek H. Galeas on 18/4/24.
//

import Foundation
import UIKit

class ListOfMoviesView: UIViewController{
    
    private var moviesTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.estimatedRowHeight = 120
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(MovieCellView.self, forCellReuseIdentifier: "MovieCellView")
        return tableView
    }()
    
    private let presenter: ListOfMoviesPresentable
    
    init(presenter: ListOfMoviesPresentable){
        self.presenter = presenter
        super.init(nibName:nil, bundle:nil)
    }
    
    required init?(coder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupTableView()
        presenter.onViewAppear()
    }
    
    private func setupTableView(){
        // Crear una vista contenedora con fondo azul marino
        let titleContainerView = UIView()
        titleContainerView.translatesAutoresizingMaskIntoConstraints = false
        titleContainerView.backgroundColor = .systemBlue
        
        // Crear un UILabel para el título
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Popular Movies"
        titleLabel.textColor = .white // Texto blanco para contrastar con el color de fondo oscuro
        titleLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        titleLabel.textAlignment = .center
        
        titleContainerView.addSubview(titleLabel)
        view.addSubview(titleContainerView)
        view.addSubview(moviesTableView)
        
        NSLayoutConstraint.activate([
            titleContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            titleContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            titleContainerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            titleContainerView.heightAnchor.constraint(equalToConstant: 50),
            titleLabel.centerXAnchor.constraint(equalTo: titleContainerView.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: titleContainerView.centerYAnchor),
            
            moviesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            moviesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            moviesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            moviesTableView.topAnchor.constraint(equalTo: titleContainerView.bottomAnchor)
        ])
        
        moviesTableView.dataSource = self
        moviesTableView.delegate = self
    }
    
}

extension ListOfMoviesView: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCellView", for: indexPath) as! MovieCellView
        //cell.backgroundColor = .red
        let model = presenter.viewModels[indexPath.row]
        
        cell.configure(model: model)
        
        return cell
    }
}

extension ListOfMoviesView: UITableViewDelegate{
    func tableView( _ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        presenter.onTapCell(atIndex: indexPath.row)
    }
}

extension ListOfMoviesView: ListOfMoviesUI{
    func update(movies: [ViewModel]) {
        print("Datos Recibidos \(movies)")
        DispatchQueue.main.async {
            self.moviesTableView.reloadData()
        }
    }
}
