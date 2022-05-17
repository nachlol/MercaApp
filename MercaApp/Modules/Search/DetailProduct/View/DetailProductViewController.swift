//
//  DetailProductViewController.swift
//  MercaApp
//
//  Created by Nicolas Chavez on 15/05/22.
//

import UIKit

class DetailProductViewController: UIViewController {

    
    @IBOutlet weak var lblConditionProduct: UILabel!
    @IBOutlet weak var lblTitleProduct: UILabel!
    @IBOutlet weak var lblPriceProduct: UILabel!
    @IBOutlet weak var lblQuotaProduct: UILabel!
    @IBOutlet weak var lblDeliverDateProduct: UILabel!
    @IBOutlet weak var lblTitleDescriptionProduct: UILabel!
    @IBOutlet weak var imageProduct: UIImageView!
    @IBOutlet weak var buttonAddCart: UIButton!
    @IBOutlet weak var buttonBuyProduct: UIButton!
    @IBOutlet weak var lblQuantityProduct: UILabel!
    
    var interactor: DetailProductBusinessLogic?
    var router: DetailProductWireFrame?
    var productId: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadInfo()
        setUpButton()
    }
    
    private func setUpButton(){
        buttonAddCart.layer.cornerRadius = 6.0
        buttonBuyProduct.layer.cornerRadius = 6.0
    }
    
    private func loadInfo(){
        guard let productID = productId else {
            return
        }
        interactor?.fetchInfoProduct(id: productID)

    }
    
    private func textCondition(condition: Condition) -> String {
        switch condition {
        case .new:
            return "Nuevo"
        case .used:
            return "Usado"
        }
    }

    private func showAlert(title: String,message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "Cancelar", style: .destructive, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func backButton(_ sender: UIButton){
        router?.gotoBackHome()
    }
    
    @IBAction func sendButton(_ sender: UIButton){
        if sender == buttonAddCart {
            showAlert(title: "Agregar al carro", message: "Deseas agregar este producto?")
        }else if sender == buttonBuyProduct {
            showAlert(title: "Compra", message: "Deseas comprar este producto?")
        }
    }
}

extension DetailProductViewController: DetailProductDisplayLogic {
    
    func displayProduct(viewModel: DetailProductViewModel) {
        DispatchQueue.main.async {
            self.lblConditionProduct.text = self.textCondition(condition: viewModel.condition)
            self.lblTitleProduct.text = viewModel.title
            self.lblPriceProduct.text = viewModel.price.colCurrency(enableSymbol: true, fractionDigits: 0)
            self.lblQuotaProduct.text = viewModel.quota
            self.lblDeliverDateProduct.text = "Disponible \(viewModel.deliveryDate) después de tu compra"
            self.lblTitleDescriptionProduct.text = "Información del producto"
            self.imageProduct.imageFromServerURL(urlString: viewModel.image, placeHolderImage: UIImage(systemName: "rectangle.inset.filled.and.person.filled") ?? UIImage())
            self.lblQuantityProduct.text = "(\(viewModel.quantityProduct) disponibles)"
        }
    }
    
    func displayErrorProduct(text: String) {
        showAlert(title: "Error", message: text)
    }
}
