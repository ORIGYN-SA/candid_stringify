# 🚀 Candid Stringify


## Overview
A Motoko library to convert any [Candid](https://github.com/dfinity/candid) data to a string.

## Install

#### Option 1 :

* Install [Mops](https://j4mwm-bqaaa-aaaam-qajbq-cai.ic0.app/#/docs/install)
* Run `mops add candid_stringify` in your project directory
* Make sure you add mops to your `dfx` file
  ```
  ...
  "defaults": {
  "build": {
    "packtool": "mops sources"
  }
},
...
```

#### Option 2 :

**Vessel** is a package manager for Motoko. [Learn More.](https://github.com/dfinity/vessel#getting-started)

* Add candid_stringify to your `package-set.dhall`
  
  ```
    let
  additions =
      [{ 
        name = "candid_stringify", 
        version = "v0.0.1", 
        repo = "https://github.com/ORIGYN-SA/candid_stringify", 
        dependencies = ["base", "candid", "xtended-numbers", "itertools"] : List Text
      }] : List Package
  ```
* Add candid_stringify to your `vessel.dhall`
  
  ```
  dependencies = [ ..., "candid_stringify" ],
  ```
* Import library in your canister
  
  ```
  import C "mo:candid_stringify/candid_stringify";
  ```

## Usage

```

import C "candid_stringify";

actor {
    
  type ComplexSample = {
    name : Text;
    age : Int;
    owner : Principal;
    address : {
      street : Text;
      phone : ?Text;
      location : {
        state : Text; 
      };
    };
    language : {
      #english : Text;
      #spanish : Text;
      #french : Text;
    };
    music : [MusicTypes];

  };

  type MusicTypes = {
    rock : Bool;
    dance : Text;
  };
    

  public func stringify_record(i : ComplexSample) : async Text {
    var blob = to_candid (i);

    C.stringify(blob, ["name", "age", "owner", "address", "street", "phone", "location", "state", "language", "english","spanish", "french","music", "rock", "dance" ]);
  };
};
```
