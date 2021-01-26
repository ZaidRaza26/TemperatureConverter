//
//  ContentView.swift
//  Converter
//
//  Created by Zaid Raza on 27/08/2020.
//  Copyright © 2020 Zaid Raza. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var units = ["Celsius","Fahrenheit","Kelvin"]
    
    @State private var selectedUnitFrom = 0
    @State private var selectedUnitTo = 0
    
    @State private var value = ""
    
    var resultingUnit : Double {
        
        let valueToInt = Double(value) ?? 0
        
        var result: Double = 0
        //celsius to fahrenheit
        if(selectedUnitFrom == 0 && selectedUnitTo == 1){
            result = (valueToInt * 9/5) + 32
        }
            //celsius to kelvin
        else if(selectedUnitFrom == 0 && selectedUnitTo == 2){
            result = valueToInt + 273.15
        }
            //fahrenheit to celsius
        else if(selectedUnitFrom == 1 && selectedUnitTo == 0){
            result = (valueToInt - 32) * 5/9
        }
            //fahrenheit to  kelvin
        else if(selectedUnitFrom == 1 && selectedUnitTo == 2){
            result = (valueToInt - 32) * 5/9 + 273.15
        }
            //kelvin to celsius
        else if(selectedUnitFrom == 2 && selectedUnitTo == 0){
            result = valueToInt - 273.15
        }
            //kelvin to Fahrenheit
        else if(selectedUnitFrom == 2 && selectedUnitTo == 1){
            result = (valueToInt - 273.15) * 9/5 + 32
        }
            
            
            //CONVERTING TO SAME UNITS
        else if(selectedUnitFrom == 0 && selectedUnitTo == 0){
            result = valueToInt
        }
        else if(selectedUnitFrom == 1 && selectedUnitTo == 1){
            result = valueToInt
        }
        else if(selectedUnitFrom == 2 && selectedUnitTo == 2){
            result = valueToInt
        }
        
        return result
        
    }
    
    var body: some View {
        
        NavigationView{
            Form{
                Section{
                    Picker("Unit to Convert From", selection: $selectedUnitFrom){
                        ForEach(0 ..< units.count){
                            Text(self.units[$0])
                        }
                    }
                    TextField("Enter value to convert", text: $value)
                }
                .navigationBarTitle("Converter")
                
                Section{
                    Picker("Unit to Convert into", selection: $selectedUnitTo){
                        ForEach(0 ..< units.count){
                            Text(self.units[$0])
                        }
                    }
                }
                Section(header: Text("Converted value").font(.headline)){
                    Text("\(resultingUnit ,specifier: "%.2f")")
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
