//
//  DefaultUserRepository.swift
//  kakao-assign
//
//  Created by  정지원 on 1/9/25.
//

import Combine

class DefaultUserRepository: UserRepository {
    private let apiService: ReqresApiService

    init(apiService: ReqresApiService) {
        self.apiService = apiService
    }

    func fetchFriends() -> AnyPublisher<[Friend], Error> {
        apiService.fetchUsers()
            .map { $0.map { $0.toEntity } }
            .eraseToAnyPublisher()
    }
}
