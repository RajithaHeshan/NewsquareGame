

import SwiftUI

struct ContentView: View {
    let columns = [
        GridItem(.flexible()), //grid layout for the button and resize
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    let colors: [Color] = [.red, .green, .blue, .yellow]
    
    @State private var buttonColors: [Color] = Array(repeating: .gray, count: 9)  // store color in each button
    @State private var score: Int = 0  // store score
    @State private var lastClickedIndex: Int? = nil //store check near colorr and check
    
    var body: some View {
        VStack {                      //vertically
            Text("Score: \(score)")
                .font(.headline)
                .padding()
            
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(0..<9) { index in
                    Button(action: {
                        handleButtonClick(at: index)
                    }) {
                        Text("Button \(index + 1)")
                            .frame(maxWidth: .infinity, maxHeight: 50)
                            .background(buttonColors[index])
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
            }
            .padding()
            
            Button(action: resetColors) {
                Text("Reset")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding()
        }
    }
    
    func randomColor() -> Color {
        colors.randomElement() ?? .gray
    }
    
    func handleButtonClick(at index: Int) {
        // Set the button color
        buttonColors[index] = randomColor()
        
        // Check for adjacent buttons
        if let lastIndex = lastClickedIndex {
            let adjacentIndices = [
                lastIndex - 1, lastIndex + 1, // Left and right
                lastIndex - 3, lastIndex + 3  // Top and bottom
            ]
            
            if adjacentIndices.contains(index) {
                if buttonColors[lastIndex] == buttonColors[index] {
                    score += 1
                }
            }
        }
        
        // Update last clicked index
        lastClickedIndex = index
    }
    
    func resetColors() {
        buttonColors = Array(repeating: .gray, count: 9)
        score = 0
        lastClickedIndex = nil
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


