//
//  UserRepository.swift
//  kakao-assign
//
//  Created by  정지원 on 1/9/25.
//

import Combine

protocol UserRepository {
    func fetchFriends() -> AnyPublisher<[Friend], Error>
}
