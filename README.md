# 🧙‍♂️ YAML to Dart
![enter image description here](https://cdn-media-1.freecodecamp.org/images/MiAWLAfns7pPgptcHFFPe8UAwMhPTPp3WWgt)

## Overview

This is a simple Dart package that converts YAML files to Dart classes. It uses the `yaml` package to parse the YAML files and generates Dart classes based on the structure of the YAML data.
## Features
- Converts YAML files to Dart classes
- Supports nested structures
- Generates classes with appropriate types
- Handles lists and maps
- Generates constructors, toMap, and fromMap methods
- Generates Enum with utility methods
- Auto-importing of required files
- Equatable classes support
- Generates copyWith methods


## Getting Started

### Step: 1  Installation

`dart pub global activate flutter_yaml_to_dart`

### Step: 2 Project Initialization

    yaml_dart init

This command will generate a `yaml_to_dart.yaml` file at the root of the project. For now, this file doesn't do much, but it’s where you can specify the folder where the Dart model files generated from YAML files should be placed.

    models:  
      - output: lib/models


### Step 3: Create Your Models

You can create a file with the `.model.yaml` extension anywhere in your project. It doesn’t matter which folder or subfolder you choose.  
In this example, I’ll create a folder called `yamls` and define two models: `product.model.yaml` and `collection.model.yaml`.

    --> my-project 
    ------- lib
    ------- yamls
    ---------- product.model.yaml
    ---------- collection.model.yaml


File `product.model.yaml`

    class: Product  
    fields:  
      - id: String  
      - price: double  
      - name: String?


File `collection.model.yaml`

    class: Collection  
    fields:  
      - name: String  
      - products: List<Product>  
      - isAvailable: bool  
      - createdAt: DateTime  
      
    toMap: true  
    fromMap: true  
    copyWith: true



### Step 4: Generate Dart Models

From the project root, run the following command to generate all the Dart models:

     yaml_dart generate

If everything goes well, the `product.dart` and `collection.dart` files will be generated inside the `lib/models` folder.  
You can change the output directory in the `yaml_to_dart.yaml` file (see Step 2).