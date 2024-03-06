//
//  workhoursApp.swift
//  workhours
//
//  Created by Christopher Anderson on 9/5/23.
//

import SwiftUI

@main
struct workhoursApp: App {
    
    @State var title: String = ""
    
    var body: some Scene {
        MenuBarExtra(title) {
            ContentView(title: $title)
        }.menuBarExtraStyle(.window)
    }
}
