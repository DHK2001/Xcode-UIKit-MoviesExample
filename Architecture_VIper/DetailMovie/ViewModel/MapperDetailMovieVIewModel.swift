//
//  MapperDetailMovieVIewModel.swift
//  Architecture_VIper
//
//  Created by Derek H. Galeas on 18/4/24.
//

import Foundation

struct MapperDetailMovieVIewModel{
    func map(entity: DetailMovieEntity) -> DetailMovieViewModel {
        .init(title: entity.title, overview: entity.overview, backdropPath: URL(string: "https://image.tmdb.org/t/p/w200" + entity.backdropPath))
    }
}
