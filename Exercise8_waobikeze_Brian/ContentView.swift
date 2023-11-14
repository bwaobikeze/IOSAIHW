//
//  ContentView.swift
//  Exercise8_waobikeze_Brian
//
//  Created by brian waobikeze on 11/10/23.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    var body: some View {
        TabView{
            ObjectIdentivicationView(classifier: ImageClassifier())
                .tabItem {
                    Image(systemName:"photo")
                    Text("Object Identivication")
                }.toolbarBackground(.visible, for: .tabBar)
            TextidentificationView(classifier: ImageClassifier())
                .tabItem {
                    Image(systemName:"doc.text")
                    Text("Text identification")
                }.toolbarBackground(.visible, for: .tabBar)
        }.accentColor(selectedTab == 0 ? .red : .black).tabViewStyle(.automatic)

 
    }
}

#Preview {
    ContentView()
}
