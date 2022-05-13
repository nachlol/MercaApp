//
//  SearchViewRouter.swift
//  MercaApp
//
//  Created by Nicolas Chavez on 12/05/22.
//

import Foundation
import UIKit

class SearchViewRouter: SearchViewWireFrame {
    
    weak var viewController: SearchViewController?
    
    static func assembleModule() -> UIViewController {
        let viewController: SearchViewController = UIStoryboard(name: "Search", bundle: nil).instantiateInitialViewController() as! SearchViewController
        let presenter = SearchViewPresenter()
        let interactor = SearchViewInteractor()
        let router = SearchViewRouter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        return viewController
    }
    
    
    func goToDetailProduct() {
        print("go tos")
    }
    
    
}
