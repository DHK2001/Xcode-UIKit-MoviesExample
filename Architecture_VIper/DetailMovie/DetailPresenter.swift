//
//  DetailPresenter.swift
//  Architecture_VIper
//
//  Created by Derek H. Galeas on 18/4/24.
//

import Foundation

protocol DetailPresenterUI: AnyObject{
    func updateUI(viewModel: DetailMovieViewModel)
}

protocol DetailPresentable: AnyObject{
    var ui: DetailPresenterUI? {get}
    var movieId: String{get}
    func onViewAppear()
}

class DetailPresenter: DetailPresentable{
    weak var ui: DetailPresenterUI?
    
    private let interactor: DetailInteractable
    let movieId: String
    private let mapper: MapperDetailMovieVIewModel
    
    init(movieId:String, interactor: DetailInteractable, mapper: MapperDetailMovieVIewModel) {
        self.interactor = interactor
        self.movieId = movieId
        self.mapper = mapper
    }
    
    func onViewAppear(){
        Task{
            let model = await interactor.getDetailMovie(withId: movieId)
            let viewModel = mapper.map(entity: model)
            await MainActor.run {
                self.ui?.updateUI(viewModel: viewModel)
                print(viewModel)
            }
        }
    }
}
