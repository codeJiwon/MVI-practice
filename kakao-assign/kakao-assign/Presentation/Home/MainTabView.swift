//
//  MainTabView.swift
//  kakao-assign
//
//  Created by  정지원 on 1/9/25.
//
import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            FriendsView()
                .tabItem {
                    Label("Friends", systemImage: "person.2")
                }
            Text("Chats")
                .tabItem {
                    Label("Chats", systemImage: "message")
                }
        }
    }
}

#Preview {
    MainTabView()
}
