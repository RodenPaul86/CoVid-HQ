//
//  SFSafariView.swift
//  CoVid HQ
//
//  Created by Paul on 4/4/21.
//  Copyright © 2021 Paul Roden Jr. All rights reserved.
//

import SwiftUI
import SafariServices

struct SFSafariView: UIViewControllerRepresentable {
    typealias UIViewControllerType = SFSafariViewController
    
    let url: URL
    
    func makeUIViewController(context: Context) -> SFSafariViewController {
        let vc = SFSafariViewController(url: url)
        vc.preferredControlTintColor = UIColor.red
        return vc
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {
        // Update the view.
    }
}

struct SFSafariView_Previews: PreviewProvider {
    static var previews: some View {
        SFSafariView(url: URL(string: "")!)
    }
}
