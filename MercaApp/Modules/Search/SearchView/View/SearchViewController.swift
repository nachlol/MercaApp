//
//  SearchViewController.swift
//  MercaApp
//
//  Created by Nicolas Chavez on 11/05/22.
//

import UIKit

class SearchViewController: UIViewController {

    // MARK: - IBOutlet -
    @IBOutlet weak var tableviewProduct: UITableView!
    @IBOutlet weak var textfieldSearch: UITextField!
    
    var listProduct: [ViewModelProduct] = [
        ViewModelProduct(title: "Nicolas", price: "$3000.00", quota: "Hasta donde no se", shippping: "Envios gratis"),
        ViewModelProduct(title: "Carlos", price: "$2000.00", quota: "Hasta 13 donde no se", shippping: "Envios gratis")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerTableview()
        textfieldSearch.setLeftPaddingPoints(35)
        textfieldSearch.layer.borderColor = UIColor.red.cgColor
        textfieldSearch.placeholder = "Estoy Buscando ..."
    }
    
    func registerTableview() {
        tableviewProduct.delegate = self
        tableviewProduct.dataSource = self
        tableviewProduct.register(UINib(nibName: "ProductTableViewCell", bundle: .main), forCellReuseIdentifier: "cellProduct")
        listProduct = listProduct.sorted(by: { view1, view2 in
            view1.title < view2.title
        })
    }
}

//  MARK: - UITableViewDataSource -
extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listProduct.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellProduct", for: indexPath) as! ProductTableViewCell
        cell.configureView(listProduct[indexPath.row])
        return cell
    }
}

extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}
