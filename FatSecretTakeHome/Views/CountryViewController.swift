//
//  CountryViewController.swift
//  FatSecretTakeHome
//
//  Created by Eunji Hwang on 17/10/2023.
//

import UIKit

class CountryViewController: UIViewController {

    var viewModel: CountryViewModel

    init(viewModel: CountryViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.allowsSelection = true
        tableView.canCancelContentTouches = true
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        makeUI()
        setupSearchBar()
        configureTableView()
        
    }

    func setNavigationBar() {
        self.title = "Select region"
        view.backgroundColor = .systemGroupedBackground
        navigationController?.navigationBar.barTintColor = .gray
        navigationController?.navigationBar.tintColor = .pill
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTapped))
        navigationItem.rightBarButtonItem?.isEnabled = false
    }
    
    func makeUI() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func setupSearchBar() {
        let searchController = UISearchController()
        navigationItem.searchController = searchController
        navigationItem.searchController?.hidesNavigationBarDuringPresentation = false
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.delegate = self
        searchController.searchBar.showsCancelButton = false
    }
    
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CountryTableViewCell.self, forCellReuseIdentifier: CellId.countryCell.rawValue)
    }
    
    @objc func doneButtonTapped() {
        viewModel.handleDoneButtonTapped(currentVC: self)
    }
    

}

extension CountryViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let text = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
        viewModel.handleSearchedText(searchText: text, currentVC: self)
    }
}



extension CountryViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellId.countryCell.rawValue, for: indexPath) as! CountryTableViewCell
        cell.countryLabel.text = viewModel.getCellLabelText(index: indexPath.row)
        let isSelected = viewModel.getCellStatus(index: indexPath.row)
        cell.isSelectedCell = isSelected
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.handleSelectedRow(index: indexPath.row, currentVC: self)
        navigationItem.rightBarButtonItem?.isEnabled = true
    }
}

