//
//  NetworkHelper.swift
//  SpacesTravel
//
//  Created by rasit on 27.09.2023.
//

import Foundation

enum Router: String {
    case spaceNews = "https://api.spaceflightnewsapi.net/v4/articles/?format=json&limit=100"
    case astronomyPictureOfTheDay = "https://api.nasa.gov/planetary/apod"
    case launches = "https://ll.thespacedevs.com/2.2.0/launch/upcoming/?limit=30"
    case events = "https://ll.thespacedevs.com/2.2.0/event/previous/?format=json&limit=30"
    case marsPhotos = "https://api.nasa.gov/mars-photos/api/v1/rovers/perseverance/latest_photos"
    
    var requiresApiKey: Bool {
           switch self {
           case .astronomyPictureOfTheDay, .marsPhotos:
               return true
           default:
               return false
        }
    }
}

let apiKey = "DEMO_KEY"

