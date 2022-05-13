//
//  SearchViewInteractor.swift
//  MercaApp
//
//  Created by Nicolas Chavez on 12/05/22.
//

import Foundation

class SearchViewInteractor: SearchViewBusinessLogic {
    
    var presenter: SearchViewPresentationLogic?
    var listProduct: [ViewModelProduct] = []
    
    func fetchProducts(text: String) {
        let peticion = HttpRequests()
        let url = URL(string: Constants.URL.main+Constants.Endpoints.textfield)!
        let fields: [String: Any] = [
            "q": text
        ]
        peticion.getHttpRequestCodable(relPath: url, httpMethod: "GET", param:[:], type: ProductData.self, errorBlock: { (data,error) in
            guard let presenter = self.presenter else { return }
            presenter.presentServiceError()
        }) { (response, code, data, headers) in
            guard let data = response as? ProductData else{ return }
            guard let presenter = self.presenter else { return }
            switch code {
            case 200:
                presenter.presentListProduct(items: data.results)
            default:
                presenter.presentServiceError()
            }
        }
    }
}
