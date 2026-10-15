import SwiftUI

struct ContentView: View {
    // MARK: - Part B: Initial Tasks Setup
    @State private var tasks: [TaskItem] = [
        TaskItem(title: "Morning Walk", completed: true),
        TaskItem(title: "Drink Water", completed: false),
        TaskItem(title: "Read Notes", completed: false),
        TaskItem(title: "Call Home", completed: true)
    ]
    
    // MARK: - Part E: Completion Count Computation
    private var completedCount: Int {
        tasks.filter { $0.completed }.count
    }
    
    // MARK: - Part G: Option B - Progress Percentage Computation
    private var progressPercentage: Int {
        guard !tasks.isEmpty else { return 0 }
        return Int((Double(completedCount) / Double(tasks.count)) * 100)
    }
    
    var body: some View {
        NavigationStack {
            List {
                // Header Block for Stats
                VStack(spacing: 2) {
                    Text("\(completedCount) / \(tasks.count) Completed")
                        .font(.headline)
                    
                    Text("\(progressPercentage)% Complete")
                        .font(.caption2)
                        .foregroundStyle(.secondary)
                }
                .frame(maxWidth: .infinity)
                .listRowBackground(Color.clear)
                .padding(.vertical, 4)
                
                // Tasks Loop Block
                ForEach($tasks) { $task in
                    VStack(alignment: .leading, spacing: 6) {
                        // Action 1: Toggle Completion Row Button
                        Button(action: {
                            task.completed.toggle()
                        }) {
                            HStack {
                                Image(systemName: task.completed ? "checkmark.circle.fill" : "circle")
                                    .foregroundStyle(task.completed ? .green : .secondary)
                                    .font(.title3)
                                
                                Text(task.title)
                                    .font(.body)
                                    .strikethrough(task.completed)
                                    .foregroundStyle(task.completed ? .secondary : .primary)
                                
                                Spacer()
                            }
                        }
                        .buttonStyle(.plain)
                        
                        Divider()
                        
                        // Action 2: Clean Navigation Link Row
                        NavigationLink(destination: TaskDetailView(task: task)) {
                            HStack {
                                Text("Details")
                                    .font(.caption2)
                                    // FIXED HERE: Changed .accent to Color.accentColor
                                    .foregroundStyle(Color.accentColor)
                                Spacer()
                            }
                        }
                        .buttonStyle(.borderless)
                    }
                    .padding(.vertical, 6)
                }
            }
            .navigationTitle("Quick Tasks")
        }
    }
}

#Preview {
    ContentView()
}
