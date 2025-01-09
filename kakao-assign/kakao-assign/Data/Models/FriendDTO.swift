//
//  FriendDTO.swift
//  kakao-assign
//
//  Created by  정지원 on 1/9/25.
//

struct FriendDTO: Codable {
    let id: Int
    let first_name: String
    let last_name: String
    let email: String
    let avatar: String

    var toEntity: Friend {
        Friend(id: id, name: "\(first_name) \(last_name)", email: email, avatar: avatar)
    }
}
