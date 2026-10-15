import SwiftUI

// MARK: - Part F: Task Detail Screen
struct TaskDetailView: View {
    let task: TaskItem
    
    var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                // Status Symbol
                Image(systemName: task.completed ? "checkmark.circle.fill" : "circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 44, height: 44)
                    .foregroundStyle(task.completed ? .green : .secondary)
                    .padding(.top, 8)
                
                // Task Title
                Text(task.title)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                // Status Text Label
                Text(task.completed ? "Completed" : "Incomplete")
                    .font(.body)
                    .fontWeight(.bold)
                    .foregroundStyle(task.completed ? .green : .red)
                    .padding(.vertical, 6)
                    .padding(.horizontal, 16)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(task.completed ? Color.green.opacity(0.15) : Color.red.opacity(0.15))
                    )
            }
            .frame(maxWidth: .infinity)
        }
        .navigationTitle("Details")
    }
}

#Preview {
    TaskDetailView(task: TaskItem(title: "Sample Task", completed: true))
}
