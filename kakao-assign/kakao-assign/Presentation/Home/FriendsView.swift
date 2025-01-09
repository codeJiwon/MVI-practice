//
//  FriendsView.swift
//  kakao-assign
//
//  Created by  정지원 on 1/9/25.
//

import SwiftUI

struct FriendsView: View {
    @StateObject private var viewModel: FriendsObservable

    init() {
        let useCase = DIContainer.shared.resolve(GetFriendsUseCase.self)
        _viewModel = StateObject(wrappedValue: FriendsObservable(getFriendsUseCase: useCase))
    }

    var body: some View {
        NavigationView {
            VStack {
                if viewModel.state.isLoading {
                    ProgressView("Loading...")
                } else if let errorMessage = viewModel.state.errorMessage {
                    Text("Error: \(errorMessage)")
                        .foregroundColor(.red)
                } else {
                    List(viewModel.state.friends) { friend in
                        NavigationLink(destination: FriendDetailView(friend: friend)) {
                            FriendRowView(friend: friend)
                        }
                    }
                }
            }
            .onAppear {
                viewModel.send(intent: .fetchFriends)
            }
            .navigationTitle("Friends")
        }
    }
}

struct FriendRowView: View {
    let friend: Friend

    var body: some View {
        HStack {
            AsyncImage(url: URL(string: friend.avatar))
                .frame(width: 50, height: 50)
                .clipShape(Circle())
            VStack(alignment: .leading) {
                Text(friend.name).font(.headline)
                Text(friend.email).font(.subheadline).foregroundColor(.gray)
            }
        }
    }
}

#Preview {
    FriendsView()
}
