//
//  SettingsTab.swift
//  CoVid HQ
//
//  Created by Paul on 4/3/21.
//

import SwiftUI
import MessageUI

struct SettingsTab: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var showView = false
    @State var facebookURL = "http://www.facebook.com/studio4designsoftware"
    @State var webSiteURL = "http://www.studio4designsoftware.weebly.com"
    @State var appStoreURLprolight = "https://apps.apple.com/us/app/prolight/id1173567157"
    @State var appStoreURLnoel = "https://apps.apple.com/us/app/noel-christmas-countdown/id1161557247"
    @State var appStoreURLnotestation = "https://apps.apple.com/us/app/notestation/id847145885"
    @State var privacyPolicy = "https://studio4designsoftware.weebly.com/covid-hq-policy.html"
    
    @State var isShowingMailView = false
    @State var alertNoMail = false
    @State var result: Result<MFMailComposeResult, Error>? = nil
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("covid hq \(UIApplication.appVersion) (\(UIApplication.appBuild))")) {
                    
                    Button(action: {
                        webSiteURL = "https://studio4designsoftware.weebly.com/covid-hq-policy.html"
                        showView = true
                    }) {
                        SettingsCell(title: "Privacy Policy", imgName: "doc.text", clr: .red)
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                    }
                    .sheet(isPresented: $showView) {
                        SFSafariView(url: URL(string: self.privacyPolicy)!)
                    }
                }
                
                Section(header: Text("studio 4 design")) {
                    
                    Button(action: {
                        
                        MFMailComposeViewController.canSendMail() ? self.isShowingMailView.toggle() : self.alertNoMail.toggle()
                        
                    }) {
                        SettingsCell(title: "Send Feedback", imgName: "envelope", clr: .red)
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                    }
                    .sheet(isPresented: $isShowingMailView) {
                        MailView(result: self.$result)
                            .accentColor(.red)
                    }
                    .alert(isPresented: self.$alertNoMail) {
                        Alert(title: Text("eMail Unavailable"), message: Text("This device can't send email. Check your email configuralion or your internet connection."))
                    }
                    
                    Button(action: {
                        
                    }) {
                        SettingsCell(title: "Need Help?", imgName: "exclamationmark.triangle", clr: .red)
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                    }
                    
                    Button(action: {
                        facebookURL = "http://www.facebook.com/studio4designsoftware"
                        showView = true
                    }) {
                        SettingsCell(title: "Like us on Facebook", imgName: "hand.thumbsup", clr: .red)
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                    }
                    .sheet(isPresented: $showView) {
                        SFSafariView(url: URL(string: self.facebookURL)!)
                    }
                    
                    Button(action: {
                        webSiteURL = "http://www.studio4designsoftware.weebly.com"
                        showView = true
                    }) {
                        SettingsCell(title: "S4D Website", imgName: "externaldrive", clr: .red)
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                    }
                    .sheet(isPresented: $showView) {
                        SFSafariView(url: URL(string: self.webSiteURL)!)
                    }
                }
                
                Section(header: Text("more apps"), footer: Text("© Studio 4 Design Software LLC")) {
                    
                    Button(action: {
                        showView = true
                    }) {
                        OtherApps(appName: "ProLight", appImage: "icon_prolight", description: "A Handy Flashlight for\niPhone and Apple Watch", color: .blue)
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                    }
                    .sheet(isPresented: $showView) {
                        SFSafariView(url: URL(string: self.appStoreURLprolight)!)
                    }
                    
                    Button(action: {
                        showView = true
                    }) {
                        OtherApps(appName: "Noel", appImage: "icon_noel", description: "Countdown to Christmas for\niPhone and iPad", color: .blue)
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                    }
                    .sheet(isPresented: $showView) {
                        SFSafariView(url: URL(string: self.appStoreURLnoel)!)
                    }
                    
                    Button(action: {
                        showView = true
                    }) {
                        OtherApps(appName: "NoteStation", appImage: "icon_notestation", description: "Simple note taking app for\niPhone and iPad", color: .blue)
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                    }
                    .sheet(isPresented: $showView) {
                        SFSafariView(url: URL(string: self.appStoreURLnotestation)!)
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitle("Settings")
        }
    }
}

struct SettingsTab_Previews: PreviewProvider {
    static var previews: some View {
        SettingsTab()
    }
}

