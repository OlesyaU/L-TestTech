//
//  Models.swift
//  L-TestTech
//
//  Created by Олеся on 27.10.2023.
//

import Foundation
enum Models {
//    models for one loop
    enum FetchMask {
        
        /// Запрос к Interactor из View Controller
//       class Request {
//           let mask: String = ""
//        }
        
        /// Запрос к Presentor из Interactor
        struct Response {
            let userPhone: String
            let userEmail: String
        }
        
        /// Запрос к View Controller из Presentor
        struct ViewModel {
            let userPhone: String
            let userEmail: String
        }
    }
    enum FetchOrRegisterUser {
        struct UserRequest {
            let mask: String
        }
        struct UserResponse {
            let mask: String
        }
//        we have class User for Realm? maybe have to use it
        struct User: Codable {
            let phone: String
            let password: String
        }
    }
}
