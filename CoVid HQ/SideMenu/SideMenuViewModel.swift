//
//  SideMenuViewModel.swift
//  CoVid HQ
//
//  Created by Paul on 3/27/21.
//  Copyright © 2021 Paul Roden Jr. All rights reserved.
//

import Foundation

enum SideMenuViewModel: Int, CaseIterable {
    case about
    case shareApp
    case privacy
    case feedback
    case moreApp
    case likeFacebook
    case website
    
    var title: String {
        switch self {
        case .about: return "About"
        case .shareApp: return "Share This App"
        case .privacy: return "Privacy Policy"
        case .feedback: return "Send Feedback"
        case .moreApp: return "More Apps"
        case .likeFacebook: return "Like us on Feedback"
        case .website: return "S4D Website"
        }
    }
    
    var imageName: String {
        switch self {
        case .about: return "person"
        case .shareApp: return "list.bullet"
        case .privacy: return "bookmark"
        case .feedback: return "bubble.left"
        case .moreApp: return "bell"
        case .likeFacebook: return "arrow.left.square"
        case .website: return ""
        }
    }
}
