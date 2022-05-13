//
//  SearchViewContract.swift
//  MercaApp
//
//  Created by Nicolas Chavez on 12/05/22.
//

import Foundation

protocol SearchViewBusinessLogic {
    func fetchProducts(text: String)
}

protocol SearchViewPresentationLogic {
    func presentServiceError()
    func presentListProduct(items: [Result])
}

protocol SearchViewDisplayLogic {
    func displayListProduct(viewModel: [ViewModelProduct])
}

protocol SearchViewWireFrame: AnyObject {
    func goToDetailProduct()
}
