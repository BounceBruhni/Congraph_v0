# Hexagonal Architecture Rules for ConGraph

## Core
The core contains the business logic and domain entities. It should be independent of external frameworks or libraries.

```dsl
folder "scripts/core_functions" {
    contains "domain entities";
    contains "business logic";
    contains "pure functions";
    must_not_contain "framework-specific code";
}
```

## Adapters
Adapters are responsible for translating data between the core and external systems (e.g., UI, databases, or external APIs).

```dsl
folder "scripts/adapter/local_usercontacts_db_adapter_functions" {
    contains "database access logic";
    contains "data mappers";
    must_not_contain "business logic";
}

folder "scripts/adapter/ui_adapter_functions" {
    contains "UI-specific logic";
    contains "event handlers";
    must_not_contain "business logic";
}

folder "scripts/adapter/applications" {
    contains "sub-folders for each application in the form 'applications_name of the application_functions'";
}
```

## Application Layer
The application layer orchestrates the interaction between the core and adapters. It may contain use cases or application services.

```dsl
folder "scripts/scene_main_scripts" {
    contains "application services";
    contains "use case logic";
    must_not_contain "framework-specific code";
    must_not_contain "business logic";
}
```

## Infrastructure
The infrastructure layer contains framework-specific code, plugins, and external dependencies.

```dsl
folder "addons" {
    contains "Godot plugins";
    contains "external libraries";
    must_not_contain "business logic";
    must_not_contain "application services";
}
```

## UI
The UI layer contains all user interface elements, including scenes, materials, and resources.

```dsl
folder "scenes" {
    contains "possible appearances of the UI (.tscn-files)";
}

folder "scenes/export_scenes" {
    sub_folder_of "scenes";
    contains ".tscn-scenes exported as Mesh-Libraries to 'resources'";
    example "A version of a Contact-Node is modeled in a 3D scene. Then, it's exported as a mesh-library to the matching 'resources' folder. The scene-file (.tscn) where it has been modeled stays as a .tscn-file in 'export_scenes'.";
}

folder "materials" {
    contains "scene-specific materials";
    must_not_contain "shared materials";
}

folder "resources" {
    contains "UI assets (e.g., images, audio, 3D models)";
    must_not_contain "business logic";
}
```

## Shared or Cross-Cutting Concerns
Shared or cross-cutting concerns, such as logging or configuration, should be isolated.

```dsl
folder "local_usercontacts_db" {
    contains "local database files";
    must_not_contain "business logic";
}
```

## Scripts

```dsl
folder "scripts" {
    contains "scene-specific folders for scripts in the form 'scene_name of the scene_scripts'";
}

folder "scripts/core_functions" {
    contains "core logic scripts that belong to the core layer of the architecture";
}

folder "scripts/adapter" {
    contains "adapter-specific folders in the form 'name of the adapter_functions'";
    example "The code for the UI-Adapter belongs into the folder 'ui_adapter_functions'.";
}
```

## General Rules
1. **Dependency Rule**: Core should not depend on adapters, infrastructure, or UI. Adapters and infrastructure can depend on the core.
2. **Separation of Concerns**: Each folder should have a single responsibility.
3. **Naming Conventions**: Use descriptive names for files and folders to indicate their purpose.