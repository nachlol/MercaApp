//
//  ProductTableViewCell.swift
//  MercaApp
//
//  Created by Nicolas Chavez on 11/05/22.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTitleProduct: UILabel!
    @IBOutlet weak var lblPriceProduct: UILabel!
    @IBOutlet weak var lblQuotaProduct: UILabel!
    @IBOutlet weak var lblShippingProduct: UILabel!
    @IBOutlet weak var imageProduct: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func configureView(_ viewmodel: ViewModelProduct) {
        lblTitleProduct.text = viewmodel.title
        lblPriceProduct.text = viewmodel.price
        lblQuotaProduct.text = viewmodel.quota
        lblShippingProduct.text = viewmodel.shippping
        imageProduct.image = UIImage(systemName: "rectangle.inset.filled.and.person.filled")
    }

}
