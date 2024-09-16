//
//  DetailMovieEntity.swift
//  Architecture_VIper
//
//  Created by Derek H. Galeas on 18/4/24.
//

import Foundation

struct DetailMovieEntity: Decodable {
    let title: String
    let overview: String
    let backdropPath: String
    let status: String
    let releaseDate: String
    let voteAverage: Double
    let voteCount: Int
}
