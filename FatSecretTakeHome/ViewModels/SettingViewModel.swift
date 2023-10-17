//
//  SettingViewModel.swift
//  FatSecretTakeHome
//
//  Created by Eunji Hwang on 18/10/2023.
//

import UIKit

final class SettingViewModel {
    
    var currentRegion: String? {
        didSet {
            onCoutryCompleted(currentRegion)
        }
    }

    var onCoutryCompleted: (String?) -> Void = { _ in }
    
    func handleSelectButtonTapped(currentVC: UIViewController) {
        let countryVM = CountryViewModel()
        countryVM.currentRegion = currentRegion
        countryVM.countrySelectionHandler = handleCountrySelect
        let countryVC = CountryViewController(viewModel: countryVM)
        currentVC.navigationController?.pushViewController(countryVC, animated: true)
    }
    
    func handleCountrySelect(country: String?) {
        self.currentRegion = country
    }
}
