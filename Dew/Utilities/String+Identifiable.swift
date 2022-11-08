//
//  StringID.swift
//  Dew
//
//  Created by Aleks Rutins on 9/13/22.
//

import Foundation
import Tagged

enum IDTag {}

extension String : Identifiable {
    public var id: String {
        self
    }
}
