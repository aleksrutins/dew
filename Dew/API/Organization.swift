//
//  Organization.swift
//  Dew
//
//  Created by Aleks Rutins on 03/07/2022.
//

import Foundation

struct SharedOrganization: Hashable, Codable {
    let name: String
    let username: String
    let slug: String
    let profile_image: URL
    let profile_image_90: URL
}
