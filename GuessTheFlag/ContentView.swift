//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Waqar Hussain on 24/12/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var showingScore = false
    @State private var yourScore = ""
    var body: some View {
        ZStack{
            RadialGradient(stops: [
                .init(color : Color(red: 0.1, green : 0.1, blue: 0.7), location : 0.3),
                .init(color: Color(red: 0.7, green: 0.2, blue: 0.1), location: 0.5)
            ], center: .top, startRadius: 200, endRadius: 700)
            .ignoresSafeArea()
            
            VStack{
                Spacer()
                Text("Guess the  Flag")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                
                VStack(spacing: 15){
                    VStack {
                        Text("Tap the flag")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .font(.title.weight(.semibold))
                    }
                    
                    
                    ForEach (0..<3) {g in
                        Button {flaggedTapped(g)
                        }
                        label: {
                            Image(countries[g])
                                .clipShape(.capsule)
                                .shadow(radius: 5)
                        }
                    }
                }
                .padding(.vertical, 20)
                .frame(maxWidth: .infinity)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                Spacer()
                Text("Score: ???")
                    .foregroundStyle(.white)
                    .font(.largeTitle.bold())
                Spacer()
                Spacer()
            }
            .padding(20)
            .alert(yourScore, isPresented: $showingScore)
            {
                Button ( "Continue",  action: askQuestion)
            }
            message : {
                Text( "Your score is ??? ")
                   
            }
        }
      
    }
    func flaggedTapped ( _ number : Int ){
        if number == correctAnswer {
            yourScore = "Correct"
        } else {
            yourScore = "Wrong Answer"
        }
       showingScore = true
    }
    func askQuestion (){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}
#Preview {
    ContentView()
}
