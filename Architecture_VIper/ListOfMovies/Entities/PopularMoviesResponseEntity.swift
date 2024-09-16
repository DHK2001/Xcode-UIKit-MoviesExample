//
//  PopularMoviesResponseEntity.swift
//  Architecture_VIper
//
//  Created by Derek H. Galeas on 18/4/24.
//

import Foundation

struct PopularMoviesResponseEntity: Decodable{
    let results: [PopularMovieEntity]
}
