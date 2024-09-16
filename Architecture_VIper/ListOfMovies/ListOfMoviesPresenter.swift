//
//  File.swift
//  Architecture_VIper
//
//  Created by Derek H. Galeas on 18/4/24.
//

import Foundation

protocol ListOfMoviesUI:AnyObject{
    func update(movies:[ViewModel])
}

protocol ListOfMoviesPresentable:AnyObject{
    var ui: ListOfMoviesUI? {get}
    var viewModels: [ViewModel] {get}
    
    func onViewAppear()
    func onTapCell(atIndex: Int)
}

class ListOfMoviesPresenter:ListOfMoviesPresentable{
    weak var ui: ListOfMoviesUI?
    
    private let listOfMoviesInteractor: ListOfMoviesInteractable
    var viewModels: [ViewModel] = []
    private var models: [PopularMovieEntity] = []
    private let mapper: Mapper
    private let router: LisOfMovieRouting
    
    init(listOfMoviesInteractor: ListOfMoviesInteractable, mapper: Mapper = Mapper(), router: LisOfMovieRouting) {
        self.listOfMoviesInteractor = listOfMoviesInteractor
        self.mapper = mapper
        self.router = router
    }
    
    func onViewAppear(){
        Task{
            models = await listOfMoviesInteractor.getListOfMovies().results
            viewModels = models.map(mapper.map(entity:))
            ui?.update(movies: viewModels)
        }    
    }
    
    func onTapCell(atIndex: Int) {
        let movieId = models[atIndex].id
        router.showDetailMovie(withMovieId: movieId.description)
    }
    
}
