import SwiftUI

struct SpinnerLoadingView: View {
    var color: Color = .accentColor // Default color
    var size: CGFloat = 25
    var disabled: Bool = false // This option lowers the opacity if used in a disabled button
    @State private var isAnimating = false
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 5)
                .opacity(0.3)
                .foregroundColor(.gray)

            Circle()
                .trim(from: 0, to: 0.4)
                .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
                .foregroundColor(color.opacity(disabled ? 0.5 : 1))
                .rotationEffect(Angle(degrees: isAnimating ? 360 : 0))
                .animation(.linear(duration: 0.8).repeatForever(autoreverses: false), value: isAnimating)
        }
        .frame(width: size, height: size) // the size of our component
        .onAppear() {
            self.isAnimating = true // Start the animation on appear
        }
    }
}

struct SpinnerLoadingView_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            SpinnerLoadingView()
        }

    }
}
