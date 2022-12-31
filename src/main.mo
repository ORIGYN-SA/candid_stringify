
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