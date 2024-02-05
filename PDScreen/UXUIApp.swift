//
//  UXUIApp.swift
//  UXUI
//
//  Created by Molly Bradach on 2/2/24.
//

import SwiftUI

@main
struct UXUIApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            MainPage()
        }
    }
}
