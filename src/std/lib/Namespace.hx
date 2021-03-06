package std.lib;

import evaluator.Evaluator;
import object.Object;

class Namespace {

    public static final name:String = null;
    final members:Map<String, Object> = new Map();
    final evaluator:Evaluator;

    public function new(evaluator:Evaluator) {
        this.evaluator = evaluator;
    }

    public function getObject():Object {
        return Object.Hash(members);
    }

    function addFunctionMember(memberName:String, parametersCount:Int, memberFunction:Array<Object>->Object) {
        members.set(memberName, Object.BuiltInFunction({parametersCount: parametersCount, memberFunction: memberFunction}));
    } 

    function addObjectMember(name:String, object:Object) {
        members.set(name, object);
    }

    function error(message:String) {
        evaluator.error.error(message);
    }
}