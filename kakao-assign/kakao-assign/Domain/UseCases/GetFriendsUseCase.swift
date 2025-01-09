//
//  GetFriendsUseCase.swift
//  kakao-assign
//
//  Created by  정지원 on 1/9/25.
//

import Combine

class GetFriendsUseCase {
    private let repository: UserRepository

    init(repository: UserRepository) {
        self.repository = repository
    }

    func execute() -> AnyPublisher<[Friend], Error> {
        repository.fetchFriends()
    }
}
