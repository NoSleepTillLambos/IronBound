import SwiftUI

struct OnBoardingView: View {
    // MARK: - PROPERTIES
    
    var gym: [Gym] = gymData

    // MARK: - BODY
    
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
