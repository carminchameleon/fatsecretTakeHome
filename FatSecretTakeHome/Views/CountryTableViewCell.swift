//
//  CountryTableViewCell.swift
//  FatSecretTakeHome
//
//  Created by Eunji Hwang on 17/10/2023.
//

import UIKit

final class CountryTableViewCell: UITableViewCell {

    var isSelectedCell = false {
        didSet {
            countryLabel.font = isSelectedCell ? UIFont.systemFont(ofSize: 16, weight: .bold) : UIFont.systemFont(ofSize: 16, weight: .regular)
            countryIcon.tintColor = isSelectedCell ? .pill : .lightGray
            accessoryType = isSelectedCell ? .checkmark : .none
        }
    }
    
    let countryIcon: UIImageView = {
        let image = Symbols.globe
        let imageView = UIImageView(image: image)
        imageView.tintColor = .lightGray
        return imageView
    }()
    
    let countryLabel: UILabel = {
        let label = UILabel()
        label.font =  UIFont.systemFont(ofSize: 16, weight: .light)
        label.textAlignment = .right
        label.textColor = .label
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        tintColor = .pill
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstraints() {
        addSubview(countryIcon)
        countryIcon.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            countryIcon.centerYAnchor.constraint(equalTo: centerYAnchor),
            countryIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            countryIcon.widthAnchor.constraint(equalToConstant: 25),
            countryIcon.heightAnchor.constraint(equalToConstant: 25),
        ])

        addSubview(countryLabel)
        countryLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            countryLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            countryLabel.leadingAnchor.constraint(equalTo: countryIcon.trailingAnchor, constant: 20),
            countryLabel.heightAnchor.constraint(equalToConstant: 25),
        ])
    }
}
