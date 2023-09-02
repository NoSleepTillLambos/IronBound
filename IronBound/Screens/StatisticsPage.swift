//
//  StatisticsPage.swift
//  IronBound
//

import SwiftUI

struct StatisticsPage: View {
    
    private var repository =  HKREPO()
    
    var items: [GridItem] {
        Array(repeating: .init(.adaptive(minimum: 120)), count: 2)
    }
    
    
    var body: some View {
        NavigationView {
            
            ZStack {
                Color("C9BFDF").ignoresSafeArea()
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVGrid(columns: items, spacing: 2) {
                        ForEach(Activity.allActivities()) {
                            Activity in
                            NavigationLink(destination: HealthDetailView(activity: Activity, repository:repository)) {
                                VStack {
                                    Text(Activity.image)
                                        .frame(width: 50, height: 50)
                                        .background(RoundedRectangle(cornerRadius: 16).fill(Color("Light").opacity(0.5)))
                                    
                                    Text(Activity.name).foregroundColor(Color.white)
                                    
                                    
                                }
                                .padding()
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .background(RoundedRectangle(cornerRadius: 16).fill(Color("46748B").opacity(0.5)))
                            }.buttonStyle(PlainButtonStyle())
                        }
                    }.padding()
                    VStack(alignment: .center, spacing: 10) {
                            
                                Text("Keep Fit")
                                    .multilineTextAlignment(.center)
                                    .font(.system(size: 18.0))
                                    .foregroundColor(.white)
                        
                            }.frame(width: 320,height: 250, alignment: .center) //<-- Here
                        .padding(12)
                        .cornerRadius(20)
                        .background(Image("gym-home").resizable().scaledToFit().overlay(Color.gray.opacity(0.4)).cornerRadius(16).frame(width: 330.0, alignment: .top))
                    VStack(alignment: .center, spacing: 10) {
                            
                                Text("Track")
                                    .multilineTextAlignment(.center)
                                    .font(.system(size: 18.0))
                                    .foregroundColor(.white)
                        
                            }.frame(width: 320,height: 250, alignment: .center) //<-- Here
                        .padding(12)
                        .cornerRadius(20)
                        .background(Image("track").resizable().scaledToFit().overlay(Color.gray.opacity(0.4)).cornerRadius(16).frame(width: 380.0, alignment: .top))
                }
                
            }.navigationTitle("Health Statistics").navigationBarTitleDisplayMode(.inline).toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        
                        Text("Health Statistics")
                            .font(.headline)
                            .foregroundColor(Color("111009"))
                    }
                }
            }
        }.onAppear {
            repository.requestAuth {
                success in
                print("Auth Success \(success)")
            }
        }
        
    }
}

struct StatisticsPage_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsPage()
    }
}
