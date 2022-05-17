//
//  ProductTableViewCell.swift
//  MercaApp
//
//  Created by Nicolas Chavez on 11/05/22.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlet -
    @IBOutlet weak var lblTitleProduct: UILabel!
    @IBOutlet weak var lblPriceProduct: UILabel!
    @IBOutlet weak var lblQuotaProduct: UILabel!
    @IBOutlet weak var lblShippingProduct: UILabel!
    @IBOutlet weak var imageProduct: UIImageView!
    
    // MARK: - Internal Properties -
    static let identifier = "cellProduct"
    
    static func nib() -> UINib {
        return UINib(nibName: "ProductTableViewCell", bundle: nil)
    }
    
    // MARK: - Lyfecycle -
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
    
    // MARK: - Internal Functions -
    func configureView(_ viewmodel: ViewModelProduct) {
        lblTitleProduct.text = viewmodel.title
        lblPriceProduct.text = viewmodel.price.colCurrency(enableSymbol: true, fractionDigits: 0)
        lblQuotaProduct.text = viewmodel.quota
        lblShippingProduct.text = viewmodel.shippping
        imageProduct.imageFromServerURL(urlString: viewmodel.image, placeHolderImage: UIImage(systemName: "rectangle.inset.filled.and.person.filled") ?? UIImage())
    }
}

