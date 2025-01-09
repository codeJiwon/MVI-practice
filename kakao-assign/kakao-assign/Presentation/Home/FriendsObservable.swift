//
//  FriendsViewModel.swift
//  kakao-assign
//
//  Created by  정지원 on 1/9/25.
//

import Combine
import SwiftUI

@MainActor
class FriendsObservable: ObservableObject {
    @Published var state = FriendsViewState()
    private let getFriendsUseCase: GetFriendsUseCase
    private var cancellables = Set<AnyCancellable>()

    init(getFriendsUseCase: GetFriendsUseCase) {
        self.getFriendsUseCase = getFriendsUseCase
    }

    func send(intent: FriendsViewIntent) {
        switch intent {
        case .fetchFriends:
            state.isLoading = true
            getFriendsUseCase.execute()
                .sink(receiveCompletion: { completion in
                    if case let .failure(error) = completion {
                        self.state.errorMessage = error.localizedDescription
                    }
                    self.state.isLoading = false
                }, receiveValue: { friends in
                    self.state.friends = friends
                })
                .store(in: &cancellables)
        }
    }
}

enum FriendsViewIntent {
    case fetchFriends
}
