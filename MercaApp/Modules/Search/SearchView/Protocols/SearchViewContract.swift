//
//  SearchViewContract.swift
//  MercaApp
//
//  Created by Nicolas Chavez on 12/05/22.
//

import Foundation
import UIKit

protocol SearchViewBusinessLogic {
    func fetchProducts(text: String ,firstSearch: Bool)
}

protocol SearchViewPresentationLogic {
    func presentServiceError()
    func presentListProduct(items: [Result] ,firstSearch: Bool)
}

protocol SearchViewDisplayLogic {
    func displayListProduct(viewModel: [ViewModelProduct])
    func displayListEmptyProduct(text: String, sizeTitle: CGFloat)
}

protocol SearchViewWireFrame: AnyObject {
    func goToDetailProduct(productId: String)
}
