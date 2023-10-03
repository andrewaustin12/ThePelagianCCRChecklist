//
//  SettingsView.swift
//  PelagianCCRChecklist
//
//  Created by andrew austin on 10/2/23.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        VStack{
            
            
            if #available(iOS 15.0, *) {
                List {
                    
                    Section {
                        Image("pelagian-app-icon")
                            .resizable()
                            .frame(width: 320, height: 300)
                        
                    }
                    
                    Section("Developer") {
                        HStack{
                            Text("Made by: ")
                            TwitterLink()
                        }
                        Text("Version 1.0")
                        Text("Part of The CCR Checklists Family")
                    }
                    
                    Section("Help") {
                        RequestFeatures()
                        GiveFeedback()
                        
                    }
                }
            } else {
                List {
                    
                }
            }
        }
    }
}

#Preview {
    SettingsView()
}


struct TwitterLink: View {
    var body: some View {
        Button(action: {
            let userName = "andy_austin_dev"
            if let url = URL(string: "twitter://user?screen_name=\(userName)") {
                UIApplication.shared.open(url)
            }
        }) {
            Text("Andy Austin")
        }
    }
}

struct RequestFeatures: View {
    var body: some View {
        Button("Request Features") {
            let email = "theccrchecklists@yahoo.com"
            if let url = URL(string: "mailto:\(email)") {
                if #available(iOS 10.0, *) {
                    UIApplication.shared.open(url)
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
        }
    }
    
    func openMail() {
        let url = URL(string: "message://")
        if let url = url {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
    }
}

struct GiveFeedback: View {
    var body: some View {
        Button("Give Feedback") {
            let email = "theccrchecklists@yahoo.com"
            if let url = URL(string: "mailto:\(email)") {
                if #available(iOS 10.0, *) {
                    UIApplication.shared.open(url)
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
        }
    }
    
    func openMail() {
        let url = URL(string: "message://")
        if let url = url {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
    }
}
