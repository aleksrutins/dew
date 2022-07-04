//
//  Article.swift
//  Dew
//
//  Created by Aleks Rutins on 03/07/2022.
//

import Foundation

struct ArticleMeta : Codable, Hashable {
    let type_of: String
    let id: Int
    let title: String
    let description: String
    let cover_image: URL?
    let readable_publish_date: String
    let social_image: URL
    let tag_list: [String]
    let tags: String
    let slug: String
    let path: String
    let url: URL
    let canonical_url: URL
    let comments_count: Int
    let positive_reactions_count: Int
    let public_reactions_count: Int
    let created_at: String
    let edited_at: String?
    let crossposted_at: String?
    let published_at: String
    let last_comment_at: String
    let user: SharedUser
    let reading_time_minutes: Int
    let flare_tag: ArticleFlareTag?
}

extension Gateway {
    func getArticles(page: Int = 1) async throws -> [ArticleMeta] { try await sendRequest(path: "articles?page=\(page)") }
}
