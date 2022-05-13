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
    
    var interactor: SearchViewBusinessLogic?
    var router: SearchViewWireFrame?
    
    var listProduct: [ViewModelProduct] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.fetchProducts(text: "Motorola%20G6")
        registerTableview()
        setUpTextfield()
    }
    
    private func setUpTextfield() {
        textfieldSearch.setLeftPaddingPoints(35)
        textfieldSearch.layer.borderColor = UIColor.red.cgColor
        textfieldSearch.placeholder = "Estoy Buscando ..."
    }
    private func registerTableview() {
        tableviewProduct.delegate = self
        tableviewProduct.dataSource = self
        tableviewProduct.register(UINib(nibName: "ProductTableViewCell", bundle: .main), forCellReuseIdentifier: "cellProduct")
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

//  MARK: - SearchViewDisplayLogic -
extension SearchViewController: SearchViewDisplayLogic {

    func displayListProduct(viewModel: [ViewModelProduct]) {
        listProduct.removeAll()
        listProduct = viewModel
        DispatchQueue.main.async {
            self.tableviewProduct.reloadData()
        }
    }
}
