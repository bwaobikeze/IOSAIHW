//
//  ObjectIdentivicationView.swift
//  Exercise8_waobikeze_Brian
//
//  Created by brian waobikeze on 11/10/23.
//

import SwiftUI
import NaturalLanguage
import CoreML

struct ObjectIdentivicationView: View {
    @State private var imageArreay = ["car","house","people"]
    @ObservedObject var classifier: ImageClassifier
    @State var classificationImageName = "car"
    var syncService = SyncService()
    var body: some View {
        ZStack{
            Color.gray
            VStack {
                HStack{
                    Text("P").font(Font.system(size: 36)).bold().foregroundColor(.red)
                    Text("a").baselineOffset(20.0) .font(Font.system(size: 20)).offset(x:-11).bold().foregroundColor(.red)
                }.offset(x:175, y: 30)
                Spacer()
                Image(classificationImageName)
                .resizable()
                .aspectRatio(350/350,contentMode: .fit)
                .frame(width: 350, height: 350)
                .border(Color.red, width: 6)
                    .onAppear{
                        classifier.detectObj(uiImage: UIImage(named: classificationImageName)!)
                        syncService.sendMessage(classificationImageName, "\(analyzeSentiment(text: classifier.imageClass!))", { error in })
                    }
                    .onTapGesture {
                        classificationImageName = (imageArreay.filter{$0 != classificationImageName}).randomElement()!
                        classifier.detectObj(uiImage: UIImage(named: classificationImageName)!)
                        syncService.sendMessage(classificationImageName, "\(analyzeSentiment(text: classifier.imageClass!))", { error in })
                    }
                Spacer()
                Group{
                    if let imageClass = classifier.imageClass {
                                           HStack{
                                                   Text("Objects:")
                                                       .font(.system(size: 26))
                                                   Text(imageClass)
                                                       .bold()
                                                       .lineLimit(7)
                                           }
                                           .foregroundStyle(.red)
                                           } else {
                                               HStack{
                                                   Text("Unable to identify objects")
                                                       .font(.system(size: 26))
                                               }
                                               .foregroundStyle(.red)
                                           }
                }
                .font(.subheadline)
                .padding()
                Spacer()

            }
            .padding()
        }.ignoresSafeArea()

    }
    func analyzeSentiment(text: String) -> String {
            
            //limit input to first 100 symbols
    
            let imagename =  classificationImageName

            
            
            //return Int.random(in: 0..<3)
            
            return imagename 
        

        }
}

#Preview {
    ObjectIdentivicationView(classifier: ImageClassifier())
}
