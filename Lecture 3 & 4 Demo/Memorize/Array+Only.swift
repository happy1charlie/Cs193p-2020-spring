//
//  Array+Only.swift
//  Memorize
//
//  Created by Charlie on 2021/1/5.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
