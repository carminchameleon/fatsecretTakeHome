//
//  SettingViewController.swift
//  FatSecretTakeHome
//
//  Created by Eunji Hwang on 18/10/2023.
//

import UIKit

final class SettingViewController: UIViewController {
   
    var viewModel: SettingViewModel
    
    init(viewModel: SettingViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let titleLabel: UILabel = {
        var label = UILabel()
        label.text = "🌎 Region"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .label
        label.textAlignment = .center
        return label
    }()

    private let selectedLabel: UILabel = {
        var label = UILabel()
        label.text = "please select region"
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.textColor = .secondaryLabel
        label.textAlignment = .center
        return label
    }()

    let selectButton: UIButton = {
        let button = UIButton(type:.custom)
        button.setTitle("Select", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = .pill
        button.clipsToBounds = true
        button.layer.cornerRadius = 6
        button.isEnabled = true
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
        addTargets()
        viewModel.onCoutryCompleted = { country in
            DispatchQueue.main.async {
                self.selectedLabel.text = country
            }
        }
    }
    
    
    func addTargets() {
        selectButton.addTarget(self, action: #selector(selectButtonTapped), for: .touchUpInside)
    }
    
    @objc func selectButtonTapped() {
        viewModel.handleSelectButtonTapped(currentVC: self)
    }
    
    func makeUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -30),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            titleLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        view.addSubview(selectedLabel)
        selectedLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            selectedLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            selectedLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            selectedLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            selectedLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        view.addSubview(selectButton)
        selectButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            selectButton.topAnchor.constraint(equalTo: selectedLabel.bottomAnchor, constant: 12),
            selectButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            selectButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            selectButton.heightAnchor.constraint(equalToConstant: 38)
        ])
    }
    
}
