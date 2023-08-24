import SwiftUI

struct OnBoardingView: View {
    
    var gym: [Gym] = gymData
    
    var body: some View {
      TabView {
        ForEach(gym[0...2]) { item in
            CardView(gym: item)
        } //: LOOP
      } 
      .tabViewStyle(PageTabViewStyle())
      .ignoresSafeArea()
    }

}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
