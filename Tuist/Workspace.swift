import ProjectDescription

/// Define Xcode workspace that contains all generated projects. See https://docs.tuist.io/reference/project-description/workspace.html for more details

let workspace = Workspace(
    name: "TuistWorkspace",
    projects: ["TuistBundleAccessors"]
)
