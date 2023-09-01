import SwiftUI

struct CardView: View {
    
    var gym: Gym
    
    @State private var isAnimating: Bool = false
  
    var body: some View {
      ZStack {
        VStack(spacing: 20) {
          
          Image(gym.image)
            
            .scaledToFit()
            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 6, y: 8)
            .scaleEffect(isAnimating ? 1.0 : 0.6)
            .rotationEffect(.degrees(self.isAnimating ? 360.0:
                                        0.0))
            .animation(.interpolatingSpring(mass: 1.0, stiffness: 100, damping: 5, initialVelocity: 0))
         
          Text(gym.title)
            .foregroundColor(Color.white)
            .font(.largeTitle)
            .fontWeight(.heavy)
            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 2, x: 2, y: 2)
          
          Text(gym.headline)
            .foregroundColor(Color.white)
            .multilineTextAlignment(.center)
            .padding(.horizontal, 16)
            .frame(maxWidth: 480)
          
          // BUTTON: START
          startView()
        } //: VSTACK
      } 
      .onAppear {
        withAnimation(.easeOut(duration: 0.5)) {
          isAnimating = true
        }
      }
      .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
      .background(LinearGradient(gradient: Gradient(colors: gym.gradientColors), startPoint: .top, endPoint: .bottom))
      
      .ignoresSafeArea()
    }
}

struct FruitCardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(gym: gymData[0])
    }
}
