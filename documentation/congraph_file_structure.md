#This markdown-file contains the folder-structure of the Project. 
#It also contains the rules, which specify what every folder is allowed to contain.

#File-Structure:

ConGraph/
├── ConGraph.csproj
├── ConGraph.sln
├── folder_structure.txt
├── icon.svg
├── icon.svg.import
├── LICENSE
├── project.godot
├── README.md
├── addons/
│   ├── folder_structure_export/
│   │   ├── plugin.cfg
│   │   ├── plugin.gd
│   │   └── plugin.gd.uid
│   └── godot-git-plugin/
│       ├── git_plugin.gdextension
│       ├── git_plugin.gdextension.uid
│       ├── LICENSE
│       ├── plugin.cfg
│       ├── THIRDPARTY.md
│       ├── linux/
│       │   └── libgit_plugin.linux.editor.x86_64.so
│       ├── macos/
│       │   └── libgit_plugin.macos.editor.universal.dylib
│       └── win64/
│           ├── libgit_plugin.windows.editor.x86_64.dll
│           ├── libgit_plugin.windows.editor.x86_64.exp
│           └── libgit_plugin.windows.editor.x86_64.lib
├── local_usercontacts_db/
│   └── local_usercontacts_db_README.md
├── materials/
│   ├── scene_add_materials/
│   ├── scene_main_materials/
│   ├── scene_settings_materials/
│   └── materials_README.md
├── resources/
│   ├── scene_add_resources/
│   ├── scene_main_resources/
│   ├── scene_settings_resources/
│   └── resources_README.md
├── scenes/
│   ├── export_scenes/
│   │   └── export_scenes_README.md
│   └── GraphVisualizer.tscn
├── scripts/
│   ├── adapter/
│   │   ├── local_usercontacts_db_adapter_functions/
│   │   │   └── local_usercontacts_db_adapter_functions_README.md
│   │   ├── ui_adapter_functions/
│   │   │   └── ui_adapter_functions_README.md
│   │   └── applications/
│   │       └── applications_README.md
│   ├── core_functions/
│   │   └── core_functions_README.md
│   ├── scene_main_scripts/
│   │   ├── NewScript.cs
│   │   ├── NewScript.cs.uid
│   │   └── GraphManager.gd
│   └── scene_settings_scripts/ 
└── documentation/
    └── congraph_file_structure.md

#give me a domain-specific-language that I can use to specify the rules of what each folder is allowed to contain, so that you understand them best:

#specification of the domain-specific-language that is being used to describe rules and structure of the project can be found at line 95

#File-Structure Rules:

materials:
-> Color-configurations (materials), that are being used by nodes which appear in the specific scene

-> Every scene has it's own materials-file in the following form: "scene_xyz_materials" (xyz needs to be replaced 
   by the name of the scene), where the materials, that are being used in the scene, are being stored

-> If a material is being used in multiple scenes, then it only needs to be contained in the folder of the scene 
   where it's first being used.

-> Example: A material "material_config_blue.tres" can be applied on a node that appears in the "main"-scene.
            It can also be used by a node in the "settings"-scene, but only if certain conditions are met.
            This means it belongs into the folder "scene_main_materials".

resources:
-> Scenes that have been exported as Mesh-Librarys and are being used by the scene which their file belongs to.

-> Imported files that are being used for the UI or UX, like pictures, 3d-models or Audios.

-> If a file that meets the requirements above, it needs to be stored in the resources-folder of the scene where 
   it's being used for the first time.

# Domain-Specific Language (DSL) Specification

The DSL used to specify folder rules in `ConGraph_Architecture_Docs.md` is designed to define the structure and content constraints of each folder in the project. Below is a short specification:

- **folder "<folder_path>" { ... }**: Defines a folder and its rules.
  - **contains "<description>"**: Specifies what the folder must contain.
  - **must_not_contain "<description>"**: Specifies what the folder must not contain.
  - **sub_folder_of "<parent_folder>"**: Indicates that the folder is a sub-folder of another folder.
  - **example "<example_description>"**: Provides an example of the folder's content or usage.

### Example:
```dsl
folder "scripts/core_functions" {
    contains "domain entities";
    contains "business logic";
    contains "pure functions";
    must_not_contain "framework-specific code";
}
```

This DSL ensures clarity and consistency in defining the project's folder structure and content rules.



