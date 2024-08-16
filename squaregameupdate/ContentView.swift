import SwiftUI

struct GameMenuView: View {
    var body: some View {
        VStack(spacing: 30) {
            // Game Logo
            Image(systemName: "gamecontroller.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
                .foregroundColor(.purple)
                .padding(.top, 60)

            Spacer()

            // Start Game Button
            Button(action: {
                // Action to start the game
            }) {
                Text("START GAME")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, minHeight: 60)
                    .background(Color.blue)
                    .cornerRadius(20)
                    .padding(.horizontal, 50) // Adjust padding for content size
            }

            // Highscore Button
            Button(action: {
                // Action to show highscore
            }) {
                Text("HIGHSCORE")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, minHeight: 60)
                    .background(Color.green)
                    .cornerRadius(20)
                    .padding(.horizontal, 50) // Adjust padding for content size
            }

            // Guide Button
            Button(action: {
                // Action to show guide
            }) {
                Text("GUIDE")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, minHeight: 60)
                    .background(Color.orange)
                    .cornerRadius(20)
                    .padding(.horizontal, 50) // Adjust padding for content size
            }

            Spacer()

        }
        .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.yellow]), startPoint: .top, endPoint: .bottom))
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView: View {
    var body: some View {
        GameMenuView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 15 Pro")
    }
}

