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
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVGrid(columns: items, spacing: 2) {
                        ForEach(Activity.allActivities()) {
                            Activity in
                            NavigationLink(destination: HealthDetailView(activity: Activity, repository:repository)) {
                                VStack {
                                    Text(Activity.image)
                                        .frame(width: 50, height: 50)
                                        .background(RoundedRectangle(cornerRadius: 16).fill(Color("46748B").opacity(0.5)))
                                    
                                    Text(Activity.name).foregroundColor(Color.white)
                                }
                                .padding()
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .background(RoundedRectangle(cornerRadius: 16).fill(Color("46748B").opacity(0.5)))
                            }.buttonStyle(PlainButtonStyle())
                        }
                    }.padding()
                }
                Text("Hey")
            }.navigationTitle("Health Statistics")
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
