//
//  DetailProductRouter.swift
//  MercaApp
//
//  Created by Nicolas Chavez on 15/05/22.
//

import Foundation
import UIKit

class DetailProductRouter: DetailProductWireFrame {
    
    weak var viewController: DetailProductViewController?
    
    static func assembleModule(productId: String) -> UIViewController {
        let viewController: DetailProductViewController = UIStoryboard(name: "DetailProductView", bundle: nil).instantiateInitialViewController() as! DetailProductViewController
        let presenter = DetailProductPresenter()
        let interactor = DetailProductInteractor()
        let router = DetailProductRouter()
        viewController.interactor = interactor
        viewController.router = router
        viewController.productId = productId
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        return viewController
    }
    
    func gotoBackHome() {
        self.viewController?.dismiss(animated: true, completion: nil)
    }
}
