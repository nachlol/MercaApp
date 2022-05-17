//
//  DetailProductInteractor.swift
//  MercaApp
//
//  Created by Nicolas Chavez on 15/05/22.
//

import Foundation

class DetailProductInteractor: DetailProductBusinessLogic {
    
    var presenter: DetailProductPresentationLogic?

    func fetchInfoProduct(id: String) {
        let peticion = HttpRequests()
        guard let url = URL(string: Constants.URL.main+Constants.Endpoints.detailItem+id) else {  return }
        peticion.getHttpRequestCodable(relPath: url, httpMethod: "GET", param:[:], type: DetailProduct.self, errorBlock: { (data,error) in
            guard let presenter = self.presenter else { return }
            presenter.presentServiceError()
        }) { (response, code, data, headers) in
            guard let data = response as? DetailProduct else{ return }
            guard let presenter = self.presenter else { return }
            switch code {
            case 200:
                presenter.presentProduct(items: data)
            default:
                presenter.presentServiceError()
            }
        }

    }
}
