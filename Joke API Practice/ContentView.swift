//
//  ContentView.swift
//  Joke API Practice
//
//  Created by Antony Holshouser on 11/10/24.
//

import SwiftUI

struct ContentView: View {
    @State var joke = "Loading"
    var body: some View {
        VStack {
            Spacer()
            Text(joke)
                .font(.largeTitle)
            Spacer()
            Button {
                joke = "Loading"
                Task {
                    await apiCall()
                }
            } label: {
                Text("Click Me For A Joke!")
                    .font(.title)
            }
            .padding()
            .border(.black)
        }
        .padding()
        .onAppear {
            Task {
                await apiCall()
            }
        }
    }
    
    func apiCall() async {
        if let url = URL(string:"https://v2.jokeapi.dev/joke/Any?type=single") {
            let request = URLRequest(url: url)
            do {
                let (data, response) = try await URLSession.shared.data(for: request)
                
                let decoder = JSONDecoder()
                do {
                    let jokeResult = try decoder.decode(JokeResult.self, from: data)
                    joke = jokeResult.joke ?? "Couldn't Load a Joke :("
                } catch {
                    print(error)
                }
            } catch {
                print(error)
            }
            
        }
        
    }
}

#Preview {
    ContentView()
}
