//
//  Mapper.swift
//  Architecture_VIper
//
//  Created by Derek H. Galeas on 18/4/24.
//

import Foundation

struct Mapper{
    func map(entity: PopularMovieEntity)->ViewModel{
        ViewModel(
            title: entity.title,
            overview: entity.overview,
            imageURL: URL(string: "https://image.tmdb.org/t/p/w200" + entity.imageURL)
        )
    }
}
