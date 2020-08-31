package compiler.symbol;

class SymbolTable {

    final scopes:Array<Scope> = [];
    var symbolIndex = 0;
    var currentScope:Scope = null;

    public function new() { }

    public function newScope() {
        currentScope = new Scope(currentScope);
    }

    public function setParent() {
        currentScope = currentScope.parent;
    }

    public function define(name:String, mutable:Bool):Symbol {
        symbolIndex++;
        final symbol = new Symbol(symbolIndex, mutable);
        currentScope.define(name, symbol);
        return symbol;
    }

    public function resolve(name:String):Symbol {
        var cScope = currentScope;

        while (cScope != null && !cScope.exists(name)) {
            cScope = cScope.parent;
        }

        if (cScope == null) {
            return null;
        }

        return cScope.resolve(name);
    }
}