//
//  Article.swift
//  L-TestTech
//
//  Created by Олеся on 05.11.2023.
//

import Foundation
struct Article: Codable {
    let id: String
    let title: String
    let text: String
    let image: String
    let sort: Int
    let date: String
}
/*
 [
 {
 "id": "1eff6329-8f49-4326-8126-d3a32e60e727",
 "title": "Abaddon",
 "text": "Whether a gesture’s charming or alarming, depends on how it’s received.",
 "image": "/uploads/post/image/1eff6329-8f49-4326-8126-d3a32e60e727/thumb_5_image_2.jpg",
 "sort": -15,
 "date": "2023-11-05T11:11:43Z"
 },
 {
 "id": "5d30df51-c6b4-431d-9c40-48645ffe6076",
 "title": "Clockwerk",
 "text": "Definitions are important.",
 "image": "/uploads/post/image/5d30df51-c6b4-431d-9c40-48645ffe6076/thumb_1_image_7.jpg",
 "sort": -16,
 "date": "2023-11-05T11:09:45Z"
 },
 {
 "id": "0e2dabdb-374e-41ff-b432-a67430d9d4f1",
 "title": "Axe",
 "text": "The littlest thing can cause a ripple effect that changes your life.",
 "image": "/uploads/post/image/0e2dabdb-374e-41ff-b432-a67430d9d4f1/thumb_10_image_8.jpg",
 "sort": -16,
 "date": "2023-11-04T21:42:28Z"
 },....
 ]
 */
