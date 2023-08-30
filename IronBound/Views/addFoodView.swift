//
//  addFoodView.swift
//  IronBound
//
//  Created by Paige Phelps on 2023/08/30.
//

import SwiftUI

struct addFoodView: View {
    @Environment (\.managedObjectContext) var managedObjectContext
    @Environment (\.dismiss) var dismiss
    
    // state varibales for food
    @State private var name = ""
    @State private var calories: Double = 0
    
    var body: some View {
        Form {
            Section {
                TextField("Name of food", text: $name)
                
                VStack {
                    Text("Calories: \(Int(calories))")
                    Slider(value: $calories, in: 0...1000, step: 10)
                }
                .padding()
                
                HStack {
                    Spacer()
                    Button("Add Food") {
                        FoodDataController().addFood(name: name, calories: calories, context: managedObjectContext)
                        dismiss()
                    }
                    Spacer()
                }
            }
        }
    }
}

struct addFoodView_Previews: PreviewProvider {
    static var previews: some View {
        addFoodView()
    }
}
