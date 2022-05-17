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
    
    // MARK: - Internal Properties -
    var interactor: SearchViewBusinessLogic?
    var router: SearchViewWireFrame?
    var listProduct: [ViewModelProduct] = []
    
    // MARK: - LyfeCycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.fetchProducts(text: textfieldSearch.text ?? "", firstSearch: true)
        registerTableview()
        setUpTextfield()
    }
    
    // MARK: - Private Functions -
    private func setUpTextfield() {
        textfieldSearch.delegate = self
        textfieldSearch.setLeftPaddingPoints(35)
        textfieldSearch.layer.borderColor = UIColor.red.cgColor
        textfieldSearch.placeholder = "Estoy Buscando ..."
    }
    private func registerTableview() {
        tableviewProduct.delegate = self
        tableviewProduct.dataSource = self
        tableviewProduct.register(ProductTableViewCell.nib(), forCellReuseIdentifier: ProductTableViewCell.identifier)
    }
}

//  MARK: - SearchViewDisplayLogic -
extension SearchViewController: SearchViewDisplayLogic {
    func displayListProduct(viewModel: [ViewModelProduct]) {
        listProduct.removeAll()
        listProduct = viewModel
        DispatchQueue.main.async {
            self.tableviewProduct.reloadData()
            self.tableviewProduct.restore()
        }
    }
    
    func displayListEmptyProduct(text: String, sizeTitle: CGFloat) {
        listProduct.removeAll()
        DispatchQueue.main.async {
            self.tableviewProduct.setEmptyMessage(text, size: sizeTitle)
            self.tableviewProduct.reloadData()
        }
    }
}

//  MARK: - UITextFieldDelegate -
extension SearchViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        if textField.text != "" {
            if let textSearch = textField.text {
                interactor?.fetchProducts(text: textSearch, firstSearch: false)
            }
        }
        return true
    }
}

//  MARK: - UITableViewDataSource,UITableViewDelegate -
extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listProduct.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductTableViewCell.identifier, for: indexPath) as! ProductTableViewCell
        cell.configureView(listProduct[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        router?.goToDetailProduct(productId: listProduct[indexPath.row].id)
    }
}
