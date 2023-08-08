//
//  MailView.swift
//  CoVid HQ
//
//  Created by Paul on 4/4/21.
//

import SwiftUI
import UIKit
import MessageUI

struct MailView: UIViewControllerRepresentable {
    
    @Environment(\.presentationMode) var presentation
    @Binding var result: Result<MFMailComposeResult, Error>?
    
    //var recipients = [String]()
    var newSubject = "CoVid HQ v\(UIApplication.appVersion) (\(UIApplication.appBuild))"
    var messageBody = "Please tell us about your experience:\n\n\n\n\n\n\n\n\nApp Name: CoVid HQ\nApp Version: \(UIApplication.appVersion) (\(UIApplication.appBuild))\nDevice: \(UIDevice.current.modelName)\n\(UIDevice.current.systemName) Version: \(UIDevice.current.systemVersion)"
    
    class Coordinator: NSObject, MFMailComposeViewControllerDelegate {
        @Binding var presentation: PresentationMode
        @Binding var result: Result<MFMailComposeResult, Error>?
        
        init(presentation: Binding<PresentationMode>,
             result: Binding<Result<MFMailComposeResult, Error>?>) {
            _presentation = presentation
            _result = result
        }
        
        func mailComposeController(_ controller: MFMailComposeViewController,
                                   didFinishWith result: MFMailComposeResult,
                                   error: Error?) {
            defer {
                $presentation.wrappedValue.dismiss()
            }
            guard error == nil else {
                self.result = .failure(error!)
                return
            }
            self.result = .success(result)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(presentation: presentation,
                           result: $result)
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<MailView>) -> MFMailComposeViewController {
        let vc = MFMailComposeViewController()
        vc.mailComposeDelegate = context.coordinator
        vc.setToRecipients(["studio4designsoftware@outlook.com"])
        vc.setSubject(newSubject)
        vc.setMessageBody(messageBody, isHTML: false)
        return vc
    }
    
    func updateUIViewController(_ uiViewController: MFMailComposeViewController,
                                context: UIViewControllerRepresentableContext<MailView>) {
    }
}

extension UIApplication {
    static var appVersion: String {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
    }
    
    static var appBuild: String {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as! String
    }
}
