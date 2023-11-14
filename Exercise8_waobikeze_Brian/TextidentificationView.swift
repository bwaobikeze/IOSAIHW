//
//  TextidentificationView.swift
//  Exercise8_waobikeze_Brian
//
//  Created by brian waobikeze on 11/10/23.
//

import SwiftUI
import NaturalLanguage
import CoreML

struct TextidentificationView: View {
    @State private var imageArreay = ["car","house","people"]
    @ObservedObject var classifier: ImageClassifier
    var syncService = SyncService()
    @State var classificationImageName = "car"
    var body: some View {
        ZStack{
            Color.gray
            VStack {
                HStack{
                    Text("P").font(Font.system(size: 36))
                    Text("a").offset(x:-6,y:-5).font(Font.system(size: 36))
                }.offset(x:150)
                Spacer()
                Image(classificationImageName)
                .resizable()
                .aspectRatio(350/350,contentMode: .fit)
                .frame(width: 350, height: 350)
                .border(Color.red)
                    .onAppear{
                        classifier.detectTxt(uiImage: UIImage(named: classificationImageName)!)
                    }
                    .onTapGesture {
                        classificationImageName = (imageArreay.filter{$0 != classificationImageName}).randomElement()!
                        classifier.detectTxt(uiImage: UIImage(named: classificationImageName)!)
                    }
                Spacer()
                Group {
                                            if let imageText = classifier.imageText {
                                                    HStack{
                                                            Text("Text:")
                                                                .font(.system(size: 26))
                                                            Text(imageText)
                                                                .bold()
                                                                .lineLimit(7)
                                                    }
                                                    .foregroundStyle(.white)
                                                    } else {
                                                        HStack{
                                                            Text("Unable to identify objects")
                                                                .font(.system(size: 26))
                                                        }
                                                        .foregroundStyle(.white)
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
    TextidentificationView(classifier: ImageClassifier())
}
