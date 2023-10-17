//
//  Constants.swift
//  FatSecretTakeHome
//
//  Created by Eunji Hwang on 17/10/2023.
//

import UIKit

struct Constant {
    static let countryList = ["Afghanistan", "Albania","Algeria","Andorra","Angola","Argentina","Armenia","Aruba","Australia",
                              "Austria","Azerbaijan", "Bahamas","Bahrain","Bangladesh","Barbados","Belarus","Belgium",
                              "Belize","Benin","Bermuda","Bhutan","Bolivia","Botswana","Brazil","Bulgaria","Burundi",
                              "Cambodia","Cameroon","Canada","Chad","Chile","China","Colombia","Comoros","Congo",
                              "Croatia","Cuba","Cyprus","Denmark","Djibouti","Dominica"]
    
    static var sortedCountryList: [String] {
        return self.countryList.sorted()
    }
    
}

enum CellId: String {
    case countryCell
}
