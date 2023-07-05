//
//  ContentView.swift
//  WhoGetsASticker
//
//  Created by Bob Witmer on 2023-07-05.
//

import SwiftUI

struct ContentView: View {
    
    @State private var students = ["Natasha",
                                   "Shuri",
                                   "Shaun",
                                   "Steve",
                                   "Tony",
                                   "Bruce"
    ]
//    @State private var students: [String] = []    // Test empty array
    @State private var selectedWinner = ""
    @State private var formattedTooters = ""
    
    var body: some View {
        VStack {
            Text("Who Gets a Sticker?")
                .font(.largeTitle)
                .fontWeight(.black)
                .foregroundColor(.indigo)
            
            Image("MyMacBuildsApps")
                .resizable()
                .scaledToFit()
                .padding()
            
            Spacer()
            
            Text("This Week's Winner is:")
                .font(.largeTitle)
            
            Text(selectedWinner)
                .font(.largeTitle)
                .fontWeight(.black)
                .foregroundColor(.indigo)
            
            Spacer()
            
            Text(formattedTooters)
                .font(.title2)

            Spacer()
            
            Button {
                if let winner = students.randomElement() {
                    selectedWinner = winner
                } else {
                    selectedWinner = "Prof G. because nobody Tooted"
                }
                 
            } label: {
                Image(systemName: "person.crop.circle.badge.questionmark")
                Text("Select Winner")
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
            .tint(.indigo)
            .disabled(students.isEmpty)
            
        }
        .onAppear() {
            if students.isEmpty {
                selectedWinner = "Prof G. because nobody Tooted"
            } else {
                formattedTooters = "This Week's Tooters Were:\n"
                for student in students {
                    formattedTooters += "\(student), "
                }
                formattedTooters.removeLast(2)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
