//
//  FriendsAPI.swift
//  geek-ios-client-server
//
//  Created by Dmitry Esyunin on 29.08.2021.
//

import Foundation
import Alamofire
import DynamicJSON



struct User {
    
}



final class PhotosAPI {
    let baseURL = "https://api.vk.com/method"
    let token = Session.shared.token
    let clientID = Session.shared.userID
    let version = "5.21"
    
    func get_(complitetion: @escaping([User]?)->()) {
        let method = "/photos.getAll"
        let parameters: Parameters = [
            "owner": clientID,
            "order" : "name",
            "count": 10,
            "fields" : "photo_50",
            "access_token" : Session.shared.token,
            "v": version]
        let url = baseURL + method
        
        AF.request(url, method: .get, parameters: parameters).responseJSON{ response in
            print(response.result)
        }
    }
}
    
    
    
    final class GroupsAPI {
        let baseURL = "https://api.vk.com/method"
        let token = Session.shared.token
        let clientID = Session.shared.userID
        let version = "5.21"
        
        func get_(complitetion: @escaping([User]?)->()) {
            let method = "/groups.get"
            let parameters: Parameters = [
                "user_id": clientID,
                "order" : "name",
                "count": 100,
                "extended": 1,
                "access_token" : Session.shared.token,
                "v": version]
            let url = baseURL + method
            
            AF.request(url, method: .get, parameters: parameters).responseJSON{ response in
                print(response.result)
            }
        }
    }
final class FriendsAPI {
    
    let baseUrl = "https://api.vk.com/method"
    let token = Session.shared.token
    let userId = Session.shared.userId
    let version = "5.21"
    
    func getFriends(completion: @escaping([FriendDynamic])->()) {
        
        let method = "/friends.get"
        let parameters: Parameters = [
            "user_id": userId,
            "order": "name",
            "count": 5,
            "fields": "photo_100, photo_50",
            "access_token": Session.shared.token,
            "v": version]
        let url = baseUrl + method
        
        AF.request(url, method: .get, parameters: parameters).responseJSON { response in
            
            print(response.data?.prettyJSON)
            
            guard let data = response.data else { return }
            
            do {
                
                guard let items = JSON(data).response.items.array else { return }
                let friends = items.map { FriendDynamic(json: $0) }
                
    
                completion(friends)
                
            } catch {
                print(error)
            }

        }
    }
}
