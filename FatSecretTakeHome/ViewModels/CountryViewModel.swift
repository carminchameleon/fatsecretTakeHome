//
//  CountryViewModel.swift
//  FatSecretTakeHome
//
//  Created by Eunji Hwang on 17/10/2023.
//

import Foundation
import UIKit

final class CountryViewModel {
    
    var rowList = Constant.sortedCountryList
    var currentRegion: String? = ""
    var countrySelectionHandler: (String?) -> Void = { _ in }
    
    func getCellLabelText(index: Int) -> String {
        return rowList[index]
    }
    
    func getCellStatus(index: Int) -> Bool {
        return currentRegion != nil && rowList[index] == currentRegion
    }
    
    var numberOfRowInSection: Int {
        return rowList.count
    }
   
    var currentSelectedIndex: Int? {
        var indexList: [Int] = []
        
        for (index, element) in rowList.enumerated() {
            if element == currentRegion {
                indexList.append(index)
            }
        }
        return indexList.first
    }
    
    func handleSearchedText(searchText: String, currentVC: CountryViewController) {
        if searchText.isEmpty {
            rowList = Constant.sortedCountryList
        } else {
            let newList = Constant.sortedCountryList.filter { $0.range(of: searchText, options: .caseInsensitive) != nil  }
            rowList = newList
        }
        currentVC.tableView.reloadData()
    }
 
    
    func handleSelectedRow(index: Int, currentVC: CountryViewController) {
        var indexPathList:[IndexPath] = []
        if let currentIndex = currentSelectedIndex {
            let index = IndexPath(row: currentIndex, section: 0)
            if let cell = currentVC.tableView.cellForRow(at: index) as? CountryTableViewCell {
                cell.isSelectedCell = false
            }
            indexPathList.append(index)
        }
    
        let newSelectedPath = IndexPath(item: index , section: 0)
        indexPathList.append(newSelectedPath)
        currentRegion = rowList[index]
        currentVC.tableView.reloadRows(at: indexPathList, with: .fade)
    }
    
    func handleDoneButtonTapped(currentVC: UIViewController) {
        self.countrySelectionHandler(self.currentRegion)
        let alert = UIAlertController(title: "Region selected :",
                                      message: currentRegion,
                                      preferredStyle: .alert)
        
        let okayAction = UIAlertAction(title: "Okay", style: .default) { _ in
            currentVC.navigationController?.popToRootViewController(animated: true)
        }
        
        alert.addAction(okayAction)
        DispatchQueue.main.async {
            currentVC.present(alert, animated: true)
        }
    }
}
