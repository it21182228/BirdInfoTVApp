import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                // Background gradient
                LinearGradient(gradient: Gradient(colors: [Color.blue, Color.green]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 40) {
                    Text("Bird Information")
                        .font(.system(size: 50, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                        .padding(.top, 100)
                        .shadow(radius: 10)
                    
                    NavigationLink(destination: BirdListView(birds: BirdData.sriLankanBirds, title: "Sri Lankan Birds")) {
                        Text("Sri Lankan Birds")
                            .font(.title2)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(LinearGradient(gradient: Gradient(colors: [Color.orange, Color.red]), startPoint: .leading, endPoint: .trailing))
                            .foregroundColor(.white)
                            .cornerRadius(15)
                            .shadow(radius: 5)
                            .padding(.horizontal, 30)
                    }
                    
                    NavigationLink(destination: BirdListView(birds: BirdData.foreignBirds, title: "Foreign Birds")) {
                        Text("Foreign Birds")
                            .font(.title2)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]), startPoint: .leading, endPoint: .trailing))
                            .foregroundColor(.white)
                            .cornerRadius(15)
                            .shadow(radius: 5)
                            .padding(.horizontal, 30)
                    }
                    Spacer()
                }
            }
        }
    }
}

struct BirdListView: View {
    let birds: [Bird]
    let title: String
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.white, Color.gray.opacity(0.2)]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text(title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding()
                
                List(birds) { bird in
                    NavigationLink(destination: BirdDetailView(bird: bird)) {
                        HStack {
                            Image(systemName: "bird.fill") // Use custom images if available
                                .foregroundColor(.blue)
                                .font(.system(size: 30))
                                .padding(.trailing, 15)
                            
                            Text(bird.name)
                                .font(.title2)
                                .foregroundColor(.black)
                        }
                    }
                    .listRowBackground(Color.white.opacity(0.8))
                    .shadow(radius: 3)
                }
                .cornerRadius(20)
                .padding()
            }
        }
    }
}

struct BirdDetailView: View {
    let bird: Bird
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.white, Color.blue.opacity(0.3)]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30) {
                Text(bird.name)
                    .font(.system(size: 45, weight: .bold))
                    .foregroundColor(.blue)
                    .padding(.top, 50)
                
                Text(bird.description)
                    .font(.title2)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                    .padding(.horizontal, 40)
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
