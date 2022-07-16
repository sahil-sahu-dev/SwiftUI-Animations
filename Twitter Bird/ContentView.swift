//
//  ContentView.swift
//  TwitterBirdAnimation
//
//  Created by Sahil Sahu on 16/07/22.
//

import SwiftUI


//MARK: Views

struct ContentView: View {
    
    @State var fillBird: Bool = false
    @State var strokeEnd: CGFloat = 0
    
    
    var lineWidth: CGFloat = 4
    
    var body: some View {
        ZStack {
            
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            if fillBird {
                TwitterBird()
                    .foregroundColor(.blue)
            }
            
            else{
                TwitterBird()
                    .stroke(lineWidth: lineWidth)
                    .foregroundColor(Color.blue)
                    .opacity(0.4)
                
                TwitterBird()
                    .trim(from: 0, to: strokeEnd)
                    .stroke(lineWidth: lineWidth)
                    .foregroundColor(Color.blue)
                
                    .onAppear() {
                        Timer.scheduledTimer(withTimeInterval: 0.35, repeats: true) { timer in
                            if (self.strokeEnd >= 0.9) {
                                withAnimation(.easeInOut) {
                                    fillBird = true
                                }
                            }
                            else {
                                withAnimation(Animation.easeOut(duration: 0.5)) {
                                    self.strokeEnd += 0.1
                                }
                            }
                            
                        }
                    }
            }
            
            
            
            
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


