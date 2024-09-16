//
//  File.swift
//  Architecture_VIper
//
//  Created by Derek H. Galeas on 18/4/24.
//

import Foundation

protocol ListOfMoviesInteractable: AnyObject {
    func getListOfMovies() async -> PopularMoviesResponseEntity
}

class ListOfMoviesInteractor: ListOfMoviesInteractable {
    
    func getListOfMovies() async -> PopularMoviesResponseEntity{
        let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=e76a54f4a91a0faa55169cfd4fda53d4")!
        let (data,_)=try! await URLSession.shared.data(from: url)
        return try! JSONDecoder().decode(PopularMoviesResponseEntity.self, from:data)
    }
    
}
