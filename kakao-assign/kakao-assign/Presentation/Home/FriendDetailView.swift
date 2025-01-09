//
//  FriendDetailView.swift
//  kakao-assign
//
//  Created by  정지원 on 1/9/25.
//
import SwiftUI

struct FriendDetailView: View {
    let friend: Friend

    var body: some View {
        VStack {
            AsyncImage(url: URL(string: friend.avatar))
                .frame(width: 100, height: 100)
                .clipShape(Circle())
            Text(friend.name).font(.largeTitle)
            Text(friend.email).font(.title2).foregroundColor(.gray)
        }
        .navigationTitle("Detail")
    }
}

