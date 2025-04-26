# 🧙‍♂️ YAML to Dart
<p align="center"> <img src="https://github.com/babakoto/flutter_yaml_to_dart/blob/main/assets/demo.png?raw=true" alt="Description de l'image"/></p>

## Overview

This is a simple Dart package that converts YAML files to Dart classes. It uses the `yaml` package to parse the YAML files and generates Dart classes based on the structure of the YAML data.
## Features
- ✅ Converts YAML files to Dart classes
- ✅ Supports nested structures
- ✅ Generates classes with appropriate types
- ✅ Handles lists and maps
- ✅ Generates constructors, toMap, and fromMap methods
- ✅ Generates Enum with utility methods
- ✅ Auto-importing of required files
- ✅ Equatable classes support
- ✅ Generates copyWith methods

## Todo 
- Generate client http/Dio
- Generate Services
- Generate architecture
- Genetate bloc/cubit 

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




## Fields
### type :  String , int , double , Object , List\<Object>, DateTime ...

    class: Collection  
    fields:  
      - name: String  
      - counts: int  
      - price: double  
      - product: Product  
      - products: List<Product>  
      - images: List<String>  
      - isAvailable: bool  
      - createdAt: DateTime  
      
    toMap: true  
    fromMap: true  
    copyWith: true


**output :**

    // ⚠️ This file is auto-generated. Do not edit.  
    import 'package:equatable/equatable.dart';  
      
    import 'product.dart';  
      
    class Collection extends Equatable {  
      final String name;  
      final int counts;  
      final double price;  
      final Product product;  
      final List<Product> products;  
      final List<String> images;  
      final bool isAvailable;  
      final DateTime createdAt;  
      
      const Collection({  
        required this.name,  
        required this.counts,  
        required this.price,  
        required this.product,  
        this.products = const [],  
        this.images = const [],  
        required this.isAvailable,  
        required this.createdAt,  
      });  
      
      
      Map<String, dynamic> toMap() {  
        return {  
          'name': name,  
          'counts': counts,  
          'price': price,  
          'product': product,  
          'products': products,  
          'images': images,  
          'isAvailable': isAvailable,  
          'createdAt': createdAt,  
        };  
      }  
      
      factory Collection.fromMap(Map<String, dynamic> json) {  
        return Collection(  
          name: json['name'] as String,  
          counts: json['counts'] as int,  
          price: json['price'] as double,  
          product: Product.fromMap(json['product']),  
          products: json['products'] != null ? List<Product>.from(json['products'].map((x) => Product.fromMap(x))) : [],  
          images: json['images'] != null ? List<String>.from(json['images']) : [],  
          isAvailable: json['isAvailable'] as bool,  
          createdAt: DateTime.parse(json['createdAt']),  
        );  
      }  
      
      @override  
      List<Object?> get props => [  
        name,  
        counts,  
        price,  
        product,  
        products,  
        images,  
        isAvailable,  
        createdAt,  
      ];  
      
      Collection copyWith({  
        String? name,  
        int? counts,  
        double? price,  
        Product? product,  
        List<Product>? products,  
        List<String>? images,  
        bool? isAvailable,  
        DateTime? createdAt,  
      }) {  
        return Collection(  
          name: name ?? this.name,  
          counts: counts ?? this.counts,  
          price: price ?? this.price,  
          product: product ?? this.product,  
          products: products ?? this.products,  
          images: images ?? this.images,  
          isAvailable: isAvailable ?? this.isAvailable,  
          createdAt: createdAt ?? this.createdAt,  
        );  
      }  
    }


#### type :  enum
When defining an **enum** type, the **values** parameter is required. It accepts an array of strings. You must list all possible enum values in this array.  
The enum type automatically escapes characters like `_`, `-`, and spaces between words.
|  input| output |
|--|--|
| active-file | `activeFile` |
| active_file | `activeFile` |
| active file | `activeFile` |



    class: Product  
    fields:   
      - status: enum
        values: ["active-file","inactive_file"]

###  Null safety
To indicate that a variable might have the value `null`, just add `?` to its type declaration:

     - price: double?


### Default value
    fields:   
      - price: int?
        default: 0
⚠️ The default value must match the defined type, just like in the Dart language.
| type | default
|--|--|--|
| int | `0` |
| double | `0.0` |
| String | `'product'` |
| bool | `false` or `true` |
| List\<String> | `"['Madagascar', 'France', 'USA']"` or `[]` |
| List\<int> | `[1,2,3]` or `[ ]` |
| DateTime | `DateTime.now()` |


🔴 For  type **enum**, the default value is defined as a **String**, and it must match one of the entries in the enum's **values** array.  
Example:

    fields:   
	  - status: enum
	    values: ["active-file","inactive_file"]
	    default: "active-file"


### Custom field
Sometimes you need to customize a field to match the API requirements. For instance, you might define a field called `createdAt`, but when retrieving its value in `fromMap`, you may need to map it to `created_at`, `created-at`, or `created at`.

    fields:   
    	  - createdAt: DateTime?
    	    default: DateTime.now()
    	    key: "created_at"


**output :**

    factory Product.fromMap(Map<String, dynamic> json) {  
      return Product(  
        createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : DateTime.now(),  
      );  
    }
