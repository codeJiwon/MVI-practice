//
//  DIContainer.swift
//  kakao-assign
//
//  Created by  정지원 on 1/9/25.
//

import Foundation

public class DIContainer {
    static let shared = DIContainer()
    
    private var container: [String: Any] = [:]
    func register<T>(_ type: T.Type, implementation: @escaping () -> T) {
        let key = String(describing: type)
        container[key] = implementation
    }

    func resolve<T>(_ type: T.Type) -> T {
        let key = String(describing: type)
        guard let implementation = container[key] as? () -> T else {
            fatalError("No implementation registered for \(key)")
        }
        return implementation()
    }

    func registerDependencies() {
        register(ReqresApiService.self) { ReqresApiService() }
        register(UserRepository.self) { DefaultUserRepository(apiService: self.resolve(ReqresApiService.self)) }
        register(GetFriendsUseCase.self) { GetFriendsUseCase(repository: self.resolve(UserRepository.self)) }
    }
}

