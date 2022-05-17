//
//  SearchViewPresenter.swift
//  MercaApp
//
//  Created by Nicolas Chavez on 12/05/22.
//

import Foundation

class SearchViewPresenter: SearchViewPresentationLogic {

    var viewController: SearchViewDisplayLogic?
    
    func presentListProduct(items: [Result], firstSearch: Bool) {
        let viewModel = items.compactMap {
            ViewModelProduct.init(id: $0.id,
                                  title: $0.title,
                                  price: $0.price ,
                                  quota: "en \($0.installments.quantity) \($0.installments.amount.colCurrency(enableSymbol: true, fractionDigits:0))",
                                  shippping: $0.shipping.freeShipping ? "Envío gratis": "",
                                  image: $0.thumbnail)
        }
        if viewModel.count > 0 {
            viewController?.displayListProduct(viewModel: viewModel)
        }else if firstSearch {
            viewController?.displayListEmptyProduct(text: "Bienvenido a \nMerca App",sizeTitle: 34)
        }else {
            viewController?.displayListEmptyProduct(text: "No hay publicaciones que \ncoincidan con tu búsqueda.", sizeTitle: 14)
        }
    }
    
    func presentServiceError() {
        viewController?.displayListEmptyProduct(text: "Tenemos Problemas de conexion \nintenta nuevamente", sizeTitle: 16)
    }
}
