//
//  ReqresApiService.swift
//  kakao-assign
//
//  Created by  정지원 on 1/9/25.
//

import Combine
import Foundation

class ReqresApiService {
    func fetchUsers() -> AnyPublisher<[FriendDTO], Error> {
        let url = URL(string: "https://reqres.in/api/users")!
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: FriendListResponse.self, decoder: JSONDecoder())
            .map(\.data)
            .eraseToAnyPublisher()
    }
}

struct FriendListResponse: Codable {
    let data: [FriendDTO]
}
