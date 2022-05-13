//
//  SearchViewPresenter.swift
//  MercaApp
//
//  Created by Nicolas Chavez on 12/05/22.
//

import Foundation

class SearchViewPresenter: SearchViewPresentationLogic {
    
    var viewController: SearchViewDisplayLogic?
    
    func presentListProduct(items: [Result]) {
        let viewModel = items.compactMap {
            ViewModelProduct.init(title: $0.title, price: $0.title , quota: $0.title, shippping: $0.title)
        }
        viewController?.displayListProduct(viewModel: viewModel)
    }
    func presentServiceError() {
        print("error")
    }
}
