//
//  DetailRouter.swift
//  Architecture_VIper
//
//  Created by Derek H. Galeas on 18/4/24.
//

import Foundation
import UIKit
import SwiftUI

protocol DetailRouting: AnyObject {
    func showDetail(fromViewController: UIViewController,
                    withMovieId movieId: String)
}

class DetailRouter: DetailRouting{
    func showDetail(fromViewController: UIViewController,
                    withMovieId movieId: String){
        let interactor = DetailInteractor()
        let presenter = DetailPresenter(
            movieId: movieId,
            interactor: interactor,
            mapper: MapperDetailMovieVIewModel()
        )
        let view = DetailView(presenter: presenter)
        view.modalPresentationStyle = .fullScreen
        view.modalTransitionStyle = .crossDissolve

        presenter.ui = view
        
        fromViewController.present(view, animated: true)
    }
}
