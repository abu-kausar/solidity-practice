// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

contract Whitelist{
    mapping (address => bool) private _isWhitelistedAddress;

    event Whitelisted(address indexed account, bool isWhitelisted);

    function addWhitelistAddress(address[] memory _address)
    external{   
        uint256 len = _address.length;
        for(uint8 i=0; i<len; i++){
            require(_isWhitelistedAddress[_address[i]] != true);
            _isWhitelistedAddress[_address[i]] = true;
            emit Whitelisted(_address[i], true);
        }
    }

    function removeWhitelistAddress(address _address)
    external{
        require(_isWhitelistedAddress[_address] != false);
        _isWhitelistedAddress[_address] = false;
        emit Whitelisted(_address, false);
    }

    function isWhitelisted(address _address)
    public
    view
    returns (bool){
        return _isWhitelistedAddress[_address];
    }
}