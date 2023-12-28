//
//  ContentView.swift
//  Calculator App
//
//  Created by Shaheer Khan on 12/28/23.
//

import SwiftUI


struct ContentView: View {
    @State var total: Double = 0.0
    @State var second: Double = 0.0
    @State var Operation: String = "None"
    @State var Continue: Bool = true
    @State var ClickedOperation: Bool = false
    func appendNumber(_ number: Double) {
            if ClickedOperation {
                second = second * 10 + number
            } else {
                total = total * 10 + number
            }
        }
    func operate() {
        if Operation == "x" {
            total *= second
        }
        else if Operation == "/" {
            total /= second
        }
        else if Operation == "-" {
            total -= second
        }
        else if Operation == "+" {
            total += second
        }
        else if Operation == "None" {
            total = second
            
        }
        second = 0.0
        ClickedOperation = false
        
    }
    var body: some View {
       
        GeometryReader { geometry in
            VStack(spacing: 0) {
                HStack{
                    if second != 0.0 || false {
                        Text("\(second)")
                    }
                    else {
                        Text("\(total)")
                    }
                    }
                .font(.largeTitle)
                .foregroundStyle(.white)
                .frame(height: geometry.size.height * 0.33)
                .frame(width: geometry.size.width * 1)
                .background(.black)
                VStack {
                    Grid {
                        GridRow {
                            Button ("C") {
                                ClickedOperation = false
                                total = 0
                                second = 0
                            }
                            Button ("+/-") {
                                if second != 0.0 {
                                    second = -second
                                }
                                else {
                                    total = -total
                                }
                                
                                }
                            
                            Button ("%") {
                                if second != 0.0  {
                                    second *= 0.01
                                }
                                else {
                                    total *= 0.01
                                }
                                
                            }
                            Button("/") {
                                ClickedOperation = true
                                Operation = "/"
                            }
                            
                            .padding()
                            .clipShape(Circle())
                        }
                        .padding(1)
                        
                        GridRow {
                            Button ("7") {
                                appendNumber(7)
                            }
                            Button ("8") {
                                appendNumber(8)
                            }
                            Button ("9") {
                                appendNumber(9)
                            }
                            Button("x") {
                                ClickedOperation = true
                                Operation = "x"
                            }
                        }
                        .padding(1)
                        GridRow {
                            Button ("4") {
                                appendNumber(4)
                            }
                            Button ("5") {
                                appendNumber(5)
                            }
                            Button ("6") {
                                appendNumber(6)
                            }
                            Button("-") {
                                ClickedOperation = true
                                Operation = "-"
                            }
                        }
                        .padding(1)
                        GridRow {
                            Button ("1") {
                                appendNumber(1)
                            }
                            Button ("2") {
                                appendNumber(2)
                            }
                            Button ("3") {
                                appendNumber(3)
                            }
                            Button("+") {
                                ClickedOperation = true
                                Operation = "+"
                            }
                        }
                        .padding(1)
                        GridRow {
                            Button ("0") {
                                appendNumber(0)
                            }
                            Button (".") {}
                            Button ("=") {
                                operate()
                            }
                        }
                        .padding(1)
                    }
                }
                .buttonStyle(.bordered)
                .font(.largeTitle)
                .foregroundStyle(.white)
                .frame(height: geometry.size.height * 0.67)
                .frame(width: geometry.size.width * 1)
                .background(.orange)
                
            }
            
            .frame(height: geometry.size.height)
            .frame(width: geometry.size.width)
        }
        
        
    }
}


#Preview {
    ContentView()
}
