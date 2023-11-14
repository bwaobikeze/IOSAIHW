//
//  ContentView.swift
//  Exercise8_waobikeze_Brian Watch App
//
//  Created by brian waobikeze on 11/10/23.
//

import SwiftUI
struct ContentView: View {
    private var syncService = SyncService()
    @State private var data: String = ""
    @State private var emojiArray = ["❓","🚗","💻","🏠"]
    @State private var recieveData: [String] = []
    @State private var emojiIndex = 0
    var body: some View {
        ZStack{
            Color.gray
            VStack {
                HStack{
                    Text("P").font(Font.system(size: 36))
                    Text("a").offset(x:-6,y:-4).font(Font.system(size: 36))
                }.offset(x:70)
                Text(emojiArray[emojiIndex ]).font(Font.system(size: 70))
                    .onAppear {syncService.dataReceived = Receive }
        
            }
        }
    }
    private func Receive(key: String, value: Any) -> Void {
         self.recieveData.append("\(Date().formatted(date: .omitted, time: .standard)) - \(key):\(value)")
        if key.contains("car"){
            self.emojiIndex = 1
        }else if key.contains("house"){
            self.emojiIndex = 3
        }else if key.contains("people"){
            self.emojiIndex = 2
        } else{
            self.emojiIndex = 0
        }
     }
}

#Preview {
    ContentView()
}
