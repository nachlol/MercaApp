//
//  DetailProductPresenter.swift
//  MercaApp
//
//  Created by Nicolas Chavez on 15/05/22.
//

import Foundation

class DetailProductPresenter: DetailProductPresentationLogic {
    
    var viewController: DetailProductDisplayLogic?
    
    func presentServiceError() {
        viewController?.displayErrorProduct(text: "Tenemos Problemas con este producto")
    }
    
    func presentProduct(items: DetailProduct) {
        let viewModel = DetailProductViewModel(condition: items.condition,
                                               title: items.title,
                                               image: items.pictures[0].url,
                                               price: items.price,
                                               quota: "Hasta 48 Cuotas", deliveryDate: items.saleTerms[0].valueName, quantityProduct: items.initialQuantity)
        viewController?.displayProduct(viewModel: viewModel)
    }
}
