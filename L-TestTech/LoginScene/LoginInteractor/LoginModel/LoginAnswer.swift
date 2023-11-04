//
//  LoginAnswer.swift
//  L-TestTech
//
//  Created by Олеся on 03.11.2023.
//

import Foundation
struct Success : Codable {
    let success: Bool
}
/*
[Request]: POST http://dev-exam.l-tech.ru/api/v1/auth
    [Headers]:
        Content-Type: application/x-www-form-urlencoded
    [Body]: 37 bytes
[Response]:
    [Status Code]: 403
    [Headers]:
        Cache-Control: no-cache
        Connection: keep-alive
        Content-Encoding: gzip
        Content-Type: application/json; charset=utf-8
        Date: Fri, 03 Nov 2023 12:18:25 GMT
        Server: nginx/1.14.0 (Ubuntu)
        Transfer-Encoding: Identity
        Vary: Accept-Encoding, Origin
        X-Request-Id: 60248379-1655-4d77-81f5-a7fd52484ef5
        X-Runtime: 0.001603
    [Body]:
        {"success":false}
[Network Duration]: 0.01591801643371582s
[Serialization Duration]: 4.347000503912568e-05s
[Result]: success(17 bytes)
*/
