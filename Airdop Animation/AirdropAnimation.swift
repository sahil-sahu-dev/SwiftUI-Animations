//
//  ContentView.swift
//  AirdropAnimation
//
//  Created by Sahil Sahu on 30/07/22.
//
import SwiftUI


//MARK: View

struct ContentView: View {
    
    
    @StateObject var vm: ContentViewModel
    
    var body: some View {
        ZStack(alignment: .center) {
            
            Color.black.edgesIgnoringSafeArea(.all)
            
            Circle()
                .stroke(lineWidth: 6)
                .frame(width: 160, height: 160)
                .opacity(vm.progressBarOpacity)
                .foregroundColor(vm.textState == .sent ? .blue : .gray)
            
            Circle()
                .trim(from: 0, to: vm.strokeEnd)
                .stroke(lineWidth: 5)
                .frame(width: 160, height: 160)
                .foregroundColor(.blue)
                .rotationEffect(Angle(degrees: -90))
            
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .renderingMode(.template)
                .aspectRatio(contentMode: .fill)
                .foregroundColor(.gray)
                .frame(width: 150, height: 150)
                .onTapGesture {
                    vm.startAnimation()
                }
                
            VStack(alignment: .center){
                
                Text("iPhone")
                    .foregroundColor(.white)
                    .font(Font.headline)
                
                Text(vm.textState == .none ? "from Sahil" : vm.textState == .waiting ? "Waiting..." : vm.textState == .sending ? "Sending" : "Sent")
                    .foregroundColor(vm.textState == .sent ? .blue : .gray)
                    .opacity(vm.textState == .waiting ?  self.vm.waitingOpactiy : 1)
                    .font(Font.headline)
                
            }
            .offset(y: 110)
            
        }
        
    }
    
}

//MARK: text state enum
enum TextState {
    case none
    case waiting
    case sending
    case sent
}

//MARK: View model

class ContentViewModel: ObservableObject {
    
    @Published var textState: TextState = .none
    @Published var waitingOpactiy: CGFloat = 1
    @Published var strokeEnd: CGFloat = 0
    
    @Published var progressBarOpacity: CGFloat = 1
    
    func startAnimation() {
        
        self.textState = .waiting
        self.waitingOpactiy = 1
        self.strokeEnd = 0
    
        progressBarOpacity = 1

        startWaiting {
            self.startSending {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    
                    self.strokeEnd = 0
                    self.textState = .sent
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        
                        withAnimation(.easeOut(duration: 1)) {
                            self.progressBarOpacity = 0
                        }
                    }
                    
                }
            }
        }
        
    }
    
    func startWaiting(completion: @escaping  () -> ()) {
        
        var total_time = 6
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if total_time > 0 {
                if self.waitingOpactiy == 1 {
                    withAnimation(.easeOut(duration: 1.2)){
                        self.waitingOpactiy = 0
                    }
                }
                
                else {
                    withAnimation(.easeIn(duration: 0.35)){
                        self.waitingOpactiy = 1
                    }
                }
                
                
                total_time -= 1
            }
            else {
                timer.invalidate()
                completion()
            }
            
        }
        
    }
    
    
    
    func startSending(completion: @escaping () -> ()) {
        
        self.textState = .sending
      
        Timer.scheduledTimer(withTimeInterval: 0.35, repeats: true) { timer in
            
            if self.strokeEnd < 1 {
                withAnimation(.linear(duration: 0.35)) {
                    self.strokeEnd += 0.1
                }
             
            }
            else {
                timer.invalidate()
                completion()
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(vm: ContentViewModel())
    }
}
