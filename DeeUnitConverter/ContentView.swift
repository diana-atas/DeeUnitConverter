//
//  ContentView.swift
//  DeeUnitConverter
//
//  Created by Diana Atas on 26/05/23.
//

import SwiftUI

struct ContentView: View {
    @State private var inputUnit = "Degree Celsius"
    @State private var outputUnit = "Fahrenheit"
    @State private var inputTemperature = 0.0
    @FocusState private var inputIsFocused: Bool
    
    let unitsTemperature = ["Degree Celsius", "Fahrenheit", "Kelvin"]
    
    var outputTemperature: Double {
        if inputUnit == "Degree Celsius" {
            if outputUnit == "Fahrenheit" {
                return (inputTemperature * 9 / 5) + 32
            }
            if outputUnit == "Kelvin" {
                return inputTemperature + 273.15
            }
        }
        
        if inputUnit == "Fahrenheit" {
            if outputUnit == "Degree Celsius" {
                return (inputTemperature - 32) * 5 / 9
            }
            if outputUnit == "Kelvin" {
                return (inputTemperature - 32) * 5 / 9 + 273.15
            }
        }
        
        if inputUnit == "Kelvin" {
            if outputUnit == "Degree Celsius" {
                return inputTemperature - 273.15
            }
            if outputUnit == "Fahrenheit" {
                return (inputTemperature - 273.15) * 9 / 5 + 32
            }
        }
        return 0.0
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Temperature", value: $inputTemperature, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($inputIsFocused)
                    Picker("", selection: $inputUnit) {
                        ForEach(unitsTemperature, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Enter Temperature")
                }
                
                Section {
                    Text(outputTemperature, format: .number)
                    Picker("", selection: $outputUnit) {
                        ForEach(unitsTemperature, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Result")
                }
            }
            .navigationTitle("Temperature Converter")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        inputIsFocused = false
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
