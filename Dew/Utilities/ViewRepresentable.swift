//
//  ViewRepresentable.swift
//  Dew
//
//  Created by Aleks Rutins on 3/20/23.
//

import Foundation
import SwiftUI

#if os(iOS)
typealias ViewRepresentable = UIViewRepresentable
#elseif os(macOS)
typealias ViewRepresentable = NSViewRepresentable
#endif
