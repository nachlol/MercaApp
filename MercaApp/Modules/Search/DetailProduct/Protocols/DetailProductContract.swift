//
//  DetailProductContract.swift
//  MercaApp
//
//  Created by Nicolas Chavez on 15/05/22.
//

import Foundation

protocol DetailProductBusinessLogic {
    func fetchInfoProduct(id: String)
}

protocol DetailProductPresentationLogic {
    func presentServiceError()
    func presentProduct(items: DetailProduct)
}

protocol DetailProductDisplayLogic {
    func displayProduct(viewModel: DetailProductViewModel)
    func displayErrorProduct(text: String)
}

protocol DetailProductWireFrame: AnyObject {
    func gotoBackHome()
}
