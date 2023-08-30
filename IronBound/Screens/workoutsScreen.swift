//
//  workoutsScreen.swift
//  IronBound
//
//  Created by Paige Phelps on 2023/08/03.
//

import SwiftUI

struct workoutsScreen: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .reverse)]) var food:
    FetchedResults<Food>
    
    @State private var showAddingView = false
    
    var body: some View {
        
        NavigationView
        {
            
            VStack(alignment: .leading) {
                
                Text("\(Int(totalCaloriesToday())) Calories today")
                    .foregroundColor(Color("BlueDark"))
                    .padding(.horizontal)
                List {
                    ForEach(food) {
                        food in
                        NavigationLink(destination: EditFoodView(food: food)) {
                            HStack {
                                
                                VStack(alignment: .leading, spacing: 6) {
                                    Text(food.name!)
                                        .bold()
                                    Text("\(Int(food.calories))") + Text(" Calories").foregroundColor(Color("C9BFDF"))
                                }
                                Spacer()
                                Text(calculateTimeSince(date: food.date!))
                                    .foregroundColor(Color("111009"))
                            }
                        }
                    }
                    .onDelete(perform: deleteFood)
                }
                .listStyle(.plain)
            }
            .navigationTitle("Your calories").foregroundColor(Color("111009"))
            .toolbar
            {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button{
                        showAddingView.toggle()
                    } label: {
                        Label("Add Food", systemImage: "plus").foregroundColor(Color("111009"))
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton().foregroundColor(Color("111009"))
                }
            }
            .sheet(isPresented: $showAddingView) {
                addFoodView()
            }
        }.navigationViewStyle(.stack)
    }
    private func deleteFood(offsets: IndexSet) {
        // swipe to delete
        withAnimation {
            offsets.map{ food[$0] }.forEach(managedObjectContext.delete)
            
            FoodDataController().save(context: managedObjectContext)
        }
    }
    
    private func totalCaloriesToday() -> Double {
        
        var caloriesToday: Double = 0
        
        for item in food {
            if Calendar.current.isDateInToday(item.date!) {
                caloriesToday += item.calories
            }
        }
        return caloriesToday
    }
}

struct workoutsScreen_Previews: PreviewProvider {
    static var previews: some View {
        workoutsScreen()
    }
}
