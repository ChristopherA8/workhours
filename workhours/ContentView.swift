//
//  ContentView.swift
//  workhours
//
//  Created by Christopher Anderson on 9/5/23.
//

import SwiftUI

struct ContentView: View {
    
    @Binding var title: String
    @State var time: Double = 0.0
    @State var seconds: Double = 0.0
    @State var minutes: Double = 0.0
    @State var hours: Double = 0.0
    @State var running = false
    @State var timerCreated = false
    @State var theme = 2
    @State var circleColor = Color.init(white: 1.0, opacity: 0.2)
    @State var ringColor = Color.init(white: 1.0, opacity: 0.3)
    
    var body: some View {
            VStack {
                HStack {
                    Spacer()
                    Image(systemName: "xmark")
                }
                .frame(width: 250)
                .padding([.top, .trailing], 10)
                .onTapGesture {
                    NSApplication.shared.terminate(nil)
                }
                Circle()
                    .strokeBorder(lineWidth: 20)
                    .foregroundStyle(circleColor)
                    .overlay {
                        VStack {
                            Text("\(time.formatted())s")
                                .font(.largeTitle)
                        }
                        .accessibilityElement(children: .combine)
                    }
                    .frame(width: 200, height: 200)
                    .overlay {
                        Circle()
                            .trim(from: 0.0, to: time / 60 / 60)
                           .rotation(.degrees(-90))
                           .stroke(ringColor ,style: StrokeStyle(lineWidth: 20, lineCap: .round))
                           .frame(width: 180, height: 180)
                    }
                    .padding()
                HStack(alignment: .center) {
                    Circle()
                        .strokeBorder(lineWidth: 5)
                        .foregroundStyle(running ? Color.init(red: 0.97, green: 0.86, blue: 0.44) : Color.init(red: 0.35, green: 0.84, blue: 0.55))
                        .overlay {
                            Text(running ? "STOP" : "START")
                                .font(.headline)
                                .bold()
                        }
                        .onTapGesture {
                            running.toggle()
                        }
                    Circle()
                        .strokeBorder(lineWidth: 5)
                        .foregroundStyle(Color.init(red: 0.91, green: 0.30, blue: 0.24))
                        .overlay {
                            Text("RESET")
                                .font(.headline)
                                .bold()
                        }
                        .onTapGesture {
                            time = 0.0
                        }
                }
                .frame(width: 200, height: 70)
                .padding([.leading, .trailing], 30)
                .padding(.bottom, 20)

        }
        .onAppear {
            if (!timerCreated) {
                timerCreated = true
                _ = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { _ in
                    if (running) {
                        time += 1.0;
                    }
                })
            }
        }
    }
}

struct previewContainer: View {
    
    @State var title: String = ""
    
    var body: some View {
        ContentView(title: $title)
    }
}

#Preview {
    previewContainer()
}
