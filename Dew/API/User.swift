//
//  User.swift
//  Dew
//
//  Created by Aleks Rutins on 03/07/2022.
//

import Foundation

struct SharedUser: Codable, Hashable {
    let name: String
    let username: String
    let twitter_username: String?
    let github_username: String?
    let website_url: URL?
    let profile_image: String
    let profile_image_90: String
}
