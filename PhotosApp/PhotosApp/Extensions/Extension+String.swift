//
//  Extension+String.swift
//  PhotosApp
//
//  Created by Shiraz Ahmed Khan on 08/07/2021.
//

import Foundation
extension String {
    var validURL: Bool {
        let regEx = "((?:http|https)://)?(?:www\\.)?[\\w\\d\\-_]+\\.\\w{2,3}(\\.\\w{2})?(/(?<=/)(?:[\\w\\d\\-./_]+)?)?"
        let predicate = NSPredicate(format: "SELF MATCHES %@", argumentArray: [regEx])
        return predicate.evaluate(with: self)
    }
}
