pragma solidity ^0.4.21;
contract CrowdSaleToken {
    
    uint256 public totalSupply;
    string public symbol;
    string public name;
    
    mapping (address => uint256) balances;
    
    event Transfer(address indexed _from,
                   address indexed _to, 
                   uint256 _value);
    
    constructor (uint256 _totalAmountOfTokens) 
    public {
        symbol = "CST";
        name = "Crowd Sale Token";
        
        totalSupply = _totalAmountOfTokens;
        balances[this] = _totalAmountOfTokens;
    }
    
    function balanceOf(address _owner) 
    external view 
    returns (uint256 balance) {
        return balances[_owner];
    }

    function transfer(address _to, 
                      uint256 _value) 
    external 
    returns (bool success) {
        require(balances[this] >= _value);
        balances[this] -= _value;
        balances[_to] += _value;
        emit Transfer(this, _to, _value);
        return true;
    }
}
